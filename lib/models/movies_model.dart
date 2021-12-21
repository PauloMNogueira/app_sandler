import 'dart:convert';

class MovieModel {
  final String originalLanguage;
  final String originalTitle;
  final String? posterPath;
  final int id;
  final bool video;
  final String overview;
  final String releaseDate;
  final bool adult;
  final String backdropPath;
  final int voteCounts;
  final String title;
  final String character;

  MovieModel({
    required this.originalLanguage,
    required this.originalTitle,
    this.posterPath,
    required this.id,
    required this.video,
    required this.overview,
    required this.releaseDate,
    required this.adult,
    required this.backdropPath,
    required this.voteCounts,
    required this.title,
    required this.character,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      posterPath: json["poster_path"],
      id: json["id"],
      video: json["video"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      adult: json["adult"],
      backdropPath: "",
      voteCounts: json["vote_count"],
      title: json["title"],
      character: json["character"]);

  factory MovieModel.fromJson(String str) =>
      MovieModel.fromMap(json.decode(str));
}

// import 'dart:convert';

// import 'package:flutter/material.dart';

// class MovieModel {
//   // final double? popularity;
//   // final int? voteCount;
//   // final bool? video;
//   // final String? posterPath;
//   // final int? id;
//   // final bool? adult;
//   // final String? backdropPath;
//   // final String? originalLanguage;
//   // final String? originalTitle;
//   // final List<int>? genreIds;
//   // final String? title;
//   // final double? voteAverage;
//   // final String? overview;
//   // final DateTime? releaseDate;
//   // final String? character;

//   MovieModel(
//       {this.popularity,
//       this.voteCount,
//       this.video,
//       this.posterPath,
//       this.id,
//       this.adult,
//       this.backdropPath,
//       this.originalLanguage,
//       this.originalTitle,
//       this.genreIds,
//       this.title,
//       this.voteAverage,
//       this.overview,
//       this.character,
//       this.releaseDate});

//   factory MovieModel.fromJson(String str) =>
//       MovieModel.fromMap(json.decode(str));

//   factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
//       popularity: json["popularity"].toDouble(),
//       adult: json["adult"],
//       backdropPath: json["backdrop_path"],
//       genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//       id: json["id"],
//       character: json["character"],
//       originalLanguage: json["original_language"],
//       originalTitle: json["original_title"],
//       overview: json["overview"],
//       posterPath: json["poster_path"],
//       releaseDate: DateTime.parse(json["release_date"]),
//       title: json["title"],
//       video: json["video"],
//       voteAverage: json["vote_average"].toDouble(),
//       voteCount: json["vote_count"]);
// }
