import '../../../data/movie/models/movie.dart';
import '../../../domain/movie/entities/movie.dart';

class MovieMapper {

  static MovieEntity toEntity4Movie(MovieModel model) {
    return MovieEntity(
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