class CreditEntity {
    CreditEntity({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        required this.character,
        required this.creditId,
        required this.order,
        required this.department,
        required this.job,
    });

    final bool? adult;
    final int? gender;
    final int? id;
    final String? knownForDepartment;
    final String? name;
    final String? originalName;
    final double? popularity;
    final String? profilePath;
    final String? character;
    final String? creditId;
    final int? order;
    final String? department;
    final String? job;

}