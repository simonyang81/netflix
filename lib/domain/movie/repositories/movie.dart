import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies({required int page});
  Future<Either> getVideo({required int movieId});
  Future<Either> getMovieCredits({required int movieId});
}