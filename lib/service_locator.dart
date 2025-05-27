import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';

import 'core/network/dio_client.dart';
import 'data/movie/repositories/movie.dart';
import 'data/movie/sources/movies.dart';
import 'domain/movie/repositories/movie.dart';
import 'domain/movie/usecases/get_movie_credits.dart';
import 'domain/movie/usecases/get_trending_movies.dart';
import 'domain/movie/usecases/get_video.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<Logger>(Logger());
  
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<MovieService>(MovieApiServiceImpl());

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetVideoUseCase>(GetVideoUseCase());
  sl.registerSingleton<GetMovieCreditsUseCase>(GetMovieCreditsUseCase());

}