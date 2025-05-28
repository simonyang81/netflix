import 'package:netflix/data/tv/models/tv_series.dart';
import 'package:netflix/domain/tv/entities/tv_series.dart';

import '../../../data/tv/models/tv.dart';
import '../../../data/tv/models/tv_video.dart';
import '../../../domain/tv/entities/tv.dart';
import '../../../domain/tv/entities/tv_video.dart';

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

  static TVVideoEntity toEntity4Video(TVVideoModel model) {
    return TVVideoEntity(
      iso6391: model.iso6391,
      iso31661: model.iso31661,
      name: model.name,
      key: model.key,
      site: model.site,
      size: model.size,
      type: model.type,
      official: model.official,
      publishedAt: model.publishedAt,
      id: model.id,
    );
  }

  static TVSeriesEntity toEntity4Series(TVSeriesModel model) {

    return TVSeriesEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      episodeRunTime: model.episodeRunTime,
      firstAirDate: model.firstAirDate,
      homepage: model.homepage,
      id: model.id,
      inProduction: model.inProduction,
      languages: model.languages,
      lastAirDate: model.lastAirDate,
      name: model.name,
      nextEpisodeToAir: model.nextEpisodeToAir,
      numberOfEpisodes: model.numberOfEpisodes,
      numberOfSeasons: model.numberOfSeasons,
      originCountry: model.originCountry,
      originalLanguage: model.originalLanguage,
      originalName: model.originalName,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      status: model.status,
      tagline: model.tagline,
      type: model.type,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
    );

  }

}