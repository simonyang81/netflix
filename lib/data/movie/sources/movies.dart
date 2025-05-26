import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

sealed class MovieService {
  Future<Either> getTrendingMovies();
}

final class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {

    try {

      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
        queryParameters: {
          'language': 'zh-CN',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取Trending影片错误: $e');
      return Left('获取Trending影片错误');
    }
    
    
  }

}