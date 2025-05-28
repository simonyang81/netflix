class TVSeriesEntity {
    TVSeriesEntity({
        required this.adult,
        required this.backdropPath,
        required this.episodeRunTime,
        required this.firstAirDate,
        required this.homepage,
        required this.id,
        required this.inProduction,
        required this.languages,
        required this.lastAirDate,
        required this.name,
        required this.nextEpisodeToAir,
        required this.numberOfEpisodes,
        required this.numberOfSeasons,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.status,
        required this.tagline,
        required this.type,
        required this.voteAverage,
        required this.voteCount,
    });

    final bool? adult;
    final String? backdropPath;
    final List<dynamic> episodeRunTime;
    final DateTime? firstAirDate;
    final String? homepage;
    final int? id;
    final bool? inProduction;
    final List<String> languages;
    final DateTime? lastAirDate;
    final String? name;
    final dynamic nextEpisodeToAir;
    final int? numberOfEpisodes;
    final int? numberOfSeasons;
    final List<String> originCountry;
    final String? originalLanguage;
    final String? originalName;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final String? status;
    final String? tagline;
    final String? type;
    final double? voteAverage;
    final int? voteCount;

}