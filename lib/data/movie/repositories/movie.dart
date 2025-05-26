import 'package:dartz/dartz.dart';
import 'package:netflix/data/movie/sources/movies.dart';

import '../../../common/helper/mapper/movie_mapper.dart';
import '../../../domain/movie/repositories/movie.dart';
import '../../../service_locator.dart';
import '../models/trending_movie.dart';

class MovieRepositoryImpl extends MovieRepository {
  
  @override
  Future<Either> getTrendingMovies() async {

    final response = await sl<MovieService>().getTrendingMovies();

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['results']).map((item) => MovieMapper.toEntity4TrendingMovie(TrendingMovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
    
  }

}