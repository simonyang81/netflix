import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/credit_mapper.dart';
import 'package:netflix/data/movie/models/credit.dart';
import 'package:netflix/data/movie/sources/movies.dart';

import '../../../common/helper/mapper/movie_mapper.dart';
import '../../../common/helper/mapper/video_mapper.dart';
import '../../../domain/movie/entities/credit.dart';
import '../../../domain/movie/repositories/movie.dart';
import '../../../service_locator.dart';
import '../models/movie.dart';
import '../models/video.dart';

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
  
  @override
  Future<Either> getVideo({required int movieId}) async {

    final response = await sl<MovieService>().getVideo(movieId: movieId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var videos = List.from(data['results']).map((item) => VideoMapper.toEntity(VideoModel.fromJson(item))).toList();
        return Right(videos);
      }
    );
    
  }
  
  @override
  Future<Either> getMovieCredits({required int movieId}) async {

    final response = await sl<MovieService>().getMovieCredits(movieId: movieId);

    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        List<CreditEntity> credits = List.from(data['cast']).map((item) => CreditMapper.toEntity(CreditModel.fromJson(item))).take(20).toList();
        return Right(credits);
      }
    );
    
  }

}