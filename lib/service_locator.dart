import 'package:get_it/get_it.dart';
import 'package:logger/web.dart';
import 'package:netflix/domain/movie/usecases/get_now_playing_movies.dart';

import 'core/network/dio_client.dart';
import 'data/movie/repositories/movie.dart';
import 'data/person/repositories/person.dart';
import 'data/movie/sources/movies.dart';
import 'data/person/sources/person.dart';
import 'domain/movie/repositories/movie.dart';
import 'domain/person/repositories/person.dart';
import 'domain/movie/usecases/get_movie_credits.dart';
import 'domain/movie/usecases/get_trending_movies.dart';
import 'domain/movie/usecases/get_video.dart';
import 'domain/person/usecases/get_person.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<Logger>(Logger());
  
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<PersonService>(PersonApiServiceImpl());

  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<PersonRepository>(PersonRepositoryImpl());

  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetVideoUseCase>(GetVideoUseCase());
  sl.registerSingleton<GetMovieCreditsUseCase>(GetMovieCreditsUseCase());
  sl.registerSingleton<GetPersonUseCase>(GetPersonUseCase());

}