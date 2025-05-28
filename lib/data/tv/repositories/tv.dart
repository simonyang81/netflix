import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/credit_mapper.dart';
import 'package:netflix/data/tv/models/tv.dart';

import 'package:netflix/domain/tv/entities/tv.dart';
import 'package:netflix/domain/tv/entities/tv_series.dart';

import '../../../common/helper/mapper/tv_mapper.dart';
import '../../../domain/person/entities/credit.dart';
import '../../../domain/tv/entities/tv_video.dart';
import '../../../domain/tv/repositories/tv.dart';
import '../../../service_locator.dart';
import '../../person/models/credit.dart';
import '../models/tv_series.dart';
import '../models/tv_video.dart';
import '../sources/tv.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getTrendingTVs() async {

    final response = await sl<TVService>().getTrendingTVs();

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<TVEntity> tvList = List.from(data['results']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(tvList);
      }
    );


  }
  
  @override
  Future<Either> getTVVideo(int tvId) async {

    final response = await sl<TVService>().getTVVideo(tvId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<TVVideoEntity> tvVideos = List.from(data['results']).map((item) => TVMapper.toEntity4Video(TVVideoModel.fromJson(item))).toList();
        return Right(tvVideos);
      }
    );
    
  }
  
  @override
  Future<Either> getTVSeriesDetail(int tvId) async {

    final response = await sl<TVService>().getTVSeriesDetail(tvId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        TVSeriesEntity tvSeriesEntity = TVMapper.toEntity4Series(TVSeriesModel.fromJson(data));
        return Right(tvSeriesEntity);
      }
    );
    
  }
  
  @override
  Future<Either> getTVCredits(int tvId) async {

    final response = await sl<TVService>().getTVCredits(tvId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<CreditEntity> credits = List.from(data['cast']).map((item) => CreditMapper.toEntity(CreditModel.fromJson(item))).toList();
        return Right(credits);
      }
    );
    
  }

}