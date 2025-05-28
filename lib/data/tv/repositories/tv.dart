import 'package:dartz/dartz.dart';
import 'package:netflix/data/tv/models/tv.dart';

import 'package:netflix/domain/tv/entities/tv.dart';

import '../../../common/helper/mapper/tv_mapper.dart';
import '../../../domain/tv/repositories/tv.dart';
import '../../../service_locator.dart';
import '../sources/tv.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either<String, List<TVEntity>>> getTrendingTVs() async {

    final response = await sl<TVService>().getTrendingTVs();

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<TVEntity> credits = List.from(data['results']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(credits);
      }
    );


  }

}