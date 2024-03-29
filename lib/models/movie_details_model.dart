import 'dart:convert';

import 'package:adam_sandler/models/movie_genre_model.dart';
import 'package:adam_sandler/models/production_company_model.dart';
import 'package:adam_sandler/models/production_country_model.dart';
import 'package:adam_sandler/models/spoken_language_model.dart';

class MovieDetailModel {
  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<MovieGenre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanyModel>? productionCompanies;
  final List<ProductionCountryModel>? productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageModel> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(String str) =>
      MovieDetailModel.fromMap(json.decode(str));

  factory MovieDetailModel.fromMap(Map<String, dynamic> json) {
    print(json);
    return MovieDetailModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      belongsToCollection: json["belongs_to_collection"],
      budget: json["budget"],
      genres: List<MovieGenre>.from(
          json["genres"].map((x) => MovieGenre.fromMap(x))),
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"].toDouble(),
      posterPath: json["poster_path"],
      productionCompanies: List<ProductionCompanyModel>.from(
          json["production_companies"]
              .map((x) => ProductionCompanyModel.fromMap(x))),
      productionCountries: List<ProductionCountryModel>.from(
          json["production_countries"]
              .map((x) => ProductionCountryModel.fromMap(x))),
      releaseDate: DateTime.parse(json["release_date"]),
      revenue: json["revenue"],
      runtime: json["runtime"],
      spokenLanguages: List<SpokenLanguageModel>.from(
          json["spoken_languages"].map((x) => SpokenLanguageModel.fromMap(x))),
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"].toDouble(),
      voteCount: json["vote_count"],
    );
  }
}
