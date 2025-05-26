import '../../../data/movie/models/trending_movie.dart';
import '../../../domain/movie/entities/trending_movie.dart';

class MovieMapper {

  static TrendingMovieEntity toEntity4TrendingMovie(TrendingMovieModel model) {
    return TrendingMovieEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds,
      id: model.id, 
      originalLanguage: model.originalLanguage, 
      originalTitle: model.originalTitle, 
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );
  }

}