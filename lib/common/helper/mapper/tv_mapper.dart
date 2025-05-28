import '../../../data/tv/models/tv.dart';
import '../../../domain/tv/entities/tv.dart';

class TVMapper {

  static TVEntity toEntity(TVModel model) {
    return TVEntity(
      backdropPath: model.backdropPath,
      id: model.id,
      name: model.name,
      originalName: model.originalName,
      overview: model.overview,
      posterPath: model.posterPath,
      mediaType: model.mediaType,
      adult: model.adult,
      originalLanguage: model.originalLanguage,
      genreIds: model.genreIds,
      popularity: model.popularity,
      firstAirDate: model.firstAirDate,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      originCountry: model.originCountry,
    );
  }
}