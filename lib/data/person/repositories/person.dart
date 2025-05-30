import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/movie_mapper.dart';

import '../../../common/helper/mapper/person_mapper.dart';
import '../../../domain/movie/entities/movie.dart';
import '../../../domain/person/repositories/person.dart';
import '../../../service_locator.dart';
import '../../movie/models/movie.dart';
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
  
  @override
  Future<Either> getPersonalMovies({required int personId}) async {

    final response = await sl<PersonService>().getPersonalMovies(personId: personId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<MovieEntity> personalMovies = List.from(data['cast']).map((item) => MovieMapper.toEntity4Movie(MovieModel.fromJson(item))).toList();
        return Right(personalMovies);
      },
    );
  }

}