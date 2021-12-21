import 'dart:convert';

import 'package:adam_sandler/models/movies_model.dart';

class MovieResponseModel {
  final List<MovieModel>? movies;

  MovieResponseModel({required this.movies});

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
          movies: List<MovieModel>.from(json["cast"].map(
        (x) {
          print(["XXXX", x["poster_path"]]);
          return MovieModel.fromMap(x);
        },
      )));

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));
}
