import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

sealed class TVService {

  Future<Either> getTrendingTVs();
  Future<Either> getTVVideo(int tvId);
  Future<Either> getTVSeriesDetail(int tvId);
  Future<Either> getTVCredits(int tvId);

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
  
  @override
  Future<Either> getTVVideo(int tvId) async {

     try {

      var response = await sl<DioClient>().get(
        ApiUrl.tvVideo.replaceAll('{series_id}', tvId.toString()),
        queryParameters: {
          'language': 'en-US',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取 TV Video 出错: $e');
      return Left('获取 TV Video 出错');
    }
    
  }
  
  @override
  Future<Either> getTVSeriesDetail(int tvId) async {

    try {

      var response = await sl<DioClient>().get(
        ApiUrl.tvSeriesDetail.replaceAll('{series_id}', tvId.toString()),
        queryParameters: {
          'language': 'zh-CN',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取 TV Series 出错: $e');
      return Left('获取 TV Series 出错');
    }
    
  }
  
  @override
  Future<Either> getTVCredits(int tvId) async {

    try {

      var response = await sl<DioClient>().get(
        ApiUrl.tvCredits.replaceAll('{series_id}', tvId.toString()),
        queryParameters: {
          'language': 'zh-CN',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取 TV 演员列表出错: $e');
      return Left('获取 TV 演员列表出错');
    }
    
  }

}