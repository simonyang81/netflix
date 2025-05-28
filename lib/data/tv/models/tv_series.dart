class TVSeriesModel {
    TVSeriesModel({
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

    factory TVSeriesModel.fromJson(Map<String, dynamic> json){ 
        return TVSeriesModel(
            adult: json["adult"],
            backdropPath: json["backdrop_path"],
            episodeRunTime: json["episode_run_time"] == null ? [] : List<dynamic>.from(json["episode_run_time"]!.map((x) => x)),
            firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
            homepage: json["homepage"],
            id: json["id"],
            inProduction: json["in_production"],
            languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x)),
            lastAirDate: DateTime.tryParse(json["last_air_date"] ?? ""),
            name: json["name"],
            nextEpisodeToAir: json["next_episode_to_air"],
            numberOfEpisodes: json["number_of_episodes"],
            numberOfSeasons: json["number_of_seasons"],
            originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
            originalLanguage: json["original_language"],
            originalName: json["original_name"],
            overview: json["overview"],
            popularity: json["popularity"],
            posterPath: json["poster_path"],
            status: json["status"],
            tagline: json["tagline"],
            type: json["type"],
            voteAverage: json["vote_average"],
            voteCount: json["vote_count"],
        );
    }

}