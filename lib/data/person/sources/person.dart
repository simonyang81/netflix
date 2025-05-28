import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/api_url.dart';
import '../../../core/network/dio_client.dart';
import '../../../service_locator.dart';

sealed class PersonService {
  Future<Either> getPerson({required int personId});
}

final class PersonApiServiceImpl extends PersonService {
  @override
  Future<Either> getPerson({required int personId}) async {

    try {

      var response = await sl<DioClient>().get(
        ApiUrl.person.replaceAll('{person_id}', personId.toString()),
        queryParameters: {
          'language': 'zh-CN',
        },
      );

      return Right(response.data);

    } on DioException catch(e) {
      sl<Logger>().e('获取人员信息出错: $e');
      return Left('获取人员信息出错');
    }

  }

}