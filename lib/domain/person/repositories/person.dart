import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either> getPerson({required int personId});
  Future<Either> getPersonalMovies({required int personId});
}