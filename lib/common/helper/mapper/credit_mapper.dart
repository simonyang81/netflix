import '../../../data/person/models/credit.dart';
import '../../../domain/person/entities/credit.dart';

class CreditMapper {

  static CreditEntity toEntity(CreditModel model) {
    return CreditEntity(
      adult: model.adult,
      gender: model.gender,
      id: model.id,
      knownForDepartment: model.knownForDepartment,
      name: model.name,
      originalName: model.originalName,
      popularity: model.popularity,
      profilePath: model.profilePath,
      character: model.character,
      creditId: model.creditId,
      order: model.order,
      department: model.department,
      job: model.job,
    );
  }

}