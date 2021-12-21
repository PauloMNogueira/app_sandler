import 'dart:convert';

class PersonModel {
  final String biography;
  final DateTime birthday;
  final DateTime? deathday;
  final int gender;
  final String homepage;
  final int id;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  PersonModel(
      {required this.biography,
      required this.birthday,
      this.deathday,
      required this.gender,
      required this.homepage,
      required this.id,
      required this.name,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath});

  factory PersonModel.fromMap(Map<String, dynamic> json) {
    return PersonModel(
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"],
        profilePath: json["profile_path"]);
  }

  factory PersonModel.fromJson(String str) =>
      PersonModel.fromMap(json.decode(str));
}
