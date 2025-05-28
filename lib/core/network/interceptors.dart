import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// This interceptor is used to show request and response logs
class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(printer: PrettyPrinter(methodCount: 0, colors: true,printEmojis: true));

  @override
  void onError( DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request ==> $requestPath'); //Error log
    logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    logger.i('${options.method} request ==> $requestPath'); //Info log
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('STATUSCODE: ${response.statusCode} \n '
        'STATUSMESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'Data: ${response.data}'); // Debug log
    handler.next(response); // continue with the Response
  }
}


class AuthorizationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNmRhYzA4Mjk3NjczZDg4MTAxZDEwNjc3YmNlZWY1ZiIsIm5iZiI6MTcyMTI5MjI2Mi41MDMsInN1YiI6IjY2OThkNWU2MjcxYzI2YTMzZDI5YTQ4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.phuSnG_F1fuZ1WF9gTrEFjyg6bF3q-HHs6BQtOP1n10';
    options.headers['User-Agent'] = 'Mozilla/5.0';
    handler.next(options); // continue with the Request
  }
}

/// 网络请求重试拦截器
/// 在网络请求失败时自动重试
class RetryInterceptor extends Interceptor {
  final int maxRetries;
  final Duration retryDelay;
  final Logger _logger = Logger();

  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final extra = err.requestOptions.extra;
    final retryCount = extra['retryCount'] ?? 0;

    if (retryCount < maxRetries && _shouldRetry(err)) {
      _logger.w('网络请求失败，正在重试... (${retryCount + 1}/$maxRetries)');
      
      // 等待一段时间后重试
      await Future.delayed(retryDelay * (retryCount + 1));
      
      // 更新重试次数
      err.requestOptions.extra['retryCount'] = retryCount + 1;
      
      try {
        // 重新发起请求
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // 如果重试也失败了，继续处理错误
        _logger.e('重试失败: $e');
      }
    }

    // 如果达到最大重试次数或不应该重试，则继续处理错误
    handler.next(err);
  }

  /// 判断是否应该重试
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode != null && 
            err.response!.statusCode! >= 500);
  }
}