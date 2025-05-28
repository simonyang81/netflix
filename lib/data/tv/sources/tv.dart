import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

sealed class TVService {

  Future<Either> getTrendingTVs();

}

class TVServiceImpl extends TVService {

  @override
  Future<Either> getTrendingTVs() async {

    try {

      var response = await sl<DioClient>().get(
        ApiUrl.trendingTVs,
        queryParameters: {
          'language': 'zh-CN',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取 Trending TV 出错: $e');
      return Left('获取 Trending TV 出错');
    }
    
  }

}