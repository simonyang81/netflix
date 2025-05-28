class TVModel {
    TVModel({
        required this.backdropPath,
        required this.id,
        required this.name,
        required this.originalName,
        required this.overview,
        required this.posterPath,
        required this.mediaType,
        required this.adult,
        required this.originalLanguage,
        required this.genreIds,
        required this.popularity,
        required this.firstAirDate,
        required this.voteAverage,
        required this.voteCount,
        required this.originCountry,
    });

    final String? backdropPath;
    final int? id;
    final String? name;
    final String? originalName;
    final String? overview;
    final String? posterPath;
    final String? mediaType;
    final bool? adult;
    final String? originalLanguage;
    final List<int> genreIds;
    final double? popularity;
    final DateTime? firstAirDate;
    final double? voteAverage;
    final int? voteCount;
    final List<String> originCountry;

    factory TVModel.fromJson(Map<String, dynamic> json){ 
        return TVModel(
            backdropPath: json["backdrop_path"],
            id: json["id"],
            name: json["name"],
            originalName: json["original_name"],
            overview: json["overview"],
            posterPath: json["poster_path"],
            mediaType: json["media_type"],
            adult: json["adult"],
            originalLanguage: json["original_language"],
            genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
            popularity: json["popularity"],
            firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
            voteAverage: json["vote_average"],
            voteCount: json["vote_count"],
            originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
        );
    }

}