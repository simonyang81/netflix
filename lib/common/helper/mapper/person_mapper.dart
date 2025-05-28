import '../../../data/person/models/person.dart';
import '../../../data/person/models/personal_movie.dart';
import '../../../domain/person/entities/person.dart';
import '../../../domain/person/entities/personal_movie.dart';

class PersonMapper {
  static PersonEntity toEntity(PersonModel model) {
    return PersonEntity(
      id: model.id,
      name: model.name,
      adult: model.adult,
      alsoKnownAs: model.alsoKnownAs,
      biography: model.biography,
      birthday: model.birthday,
      deathday: model.deathday,
      gender: model.gender,
      homepage: model.homepage,
      imdbId: model.imdbId,
      knownForDepartment: model.knownForDepartment,
      placeOfBirth: model.placeOfBirth,
      popularity: model.popularity,
      profilePath: model.profilePath,
    );
  }


  static PersonalMovieEntity toMovieEntity(PersonMovieModel model) {
    return PersonalMovieEntity(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      character: model.character,
      creditId: model.creditId,
      order: model.order,
      department: model.department,
      job: model.job,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      video: model.video,
      adult: model.adult,
    );
  }
}