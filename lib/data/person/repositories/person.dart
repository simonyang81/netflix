import 'package:dartz/dartz.dart';

import '../../../common/helper/mapper/person_mapper.dart';
import '../../../domain/person/repositories/person.dart';
import '../../../service_locator.dart';
import '../models/person.dart';
import '../sources/person.dart';

class PersonRepositoryImpl extends PersonRepository {

  @override
  Future<Either> getPerson({required int personId}) async {

    final response = await sl<PersonService>().getPerson(personId: personId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(PersonMapper.toEntity(PersonModel.fromJson(data)));
      },
    );
  }

}