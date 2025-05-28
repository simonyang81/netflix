import '../../../data/person/models/person.dart';
import '../../../domain/person/entities/person.dart';

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

}