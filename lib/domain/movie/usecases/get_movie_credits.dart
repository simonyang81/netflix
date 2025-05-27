import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/movie/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

class GetMovieCreditsUseCase extends UseCase<Either, int> {
  
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieCredits(movieId: params!);
  }
  
}