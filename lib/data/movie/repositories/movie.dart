import 'package:dartz/dartz.dart';
import 'package:netflix/data/movie/sources/movies.dart';

import '../../../common/helper/mapper/movie_mapper.dart';
import '../../../domain/movie/repositories/movie.dart';
import '../../../service_locator.dart';
import '../models/movie.dart';

class MovieRepositoryImpl extends MovieRepository {

  @override
  Future<Either> getTrendingMovies() async {

    final response = await sl<MovieService>().getTrendingMovies();

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results']).map((item) => MovieMapper.toEntity4Movie(MovieModel.fromJson(item))).take(8).toList();
        return Right(movies);
      }
    );
    
  }
  
  @override
  Future<Either> getNowPlayingMovies({required int page}) async {

    final response = await sl<MovieService>().getNowPlayingMovies(page: page);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results']).map((item) => MovieMapper.toEntity4Movie(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
    
  }

}