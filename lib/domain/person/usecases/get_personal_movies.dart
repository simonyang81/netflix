import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repositories/person.dart';

class GetPersonalMoviesUseCase extends UseCase<Either, int> {
  
  @override
  Future<Either> call({int? params}) async {
    return await sl<PersonRepository>().getPersonalMovies(personId: params!);
  }
  
}