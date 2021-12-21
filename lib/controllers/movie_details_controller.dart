import 'package:adam_sandler/errors/movies_error.dart';
import 'package:adam_sandler/models/movie_details_model.dart';
import 'package:adam_sandler/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieDetailsController {
  final _repository = MovieRepository();
  MovieDetailModel? movieDetailsModel;
  late MovieError movieError;
  late bool loading = true;

  MovieDetailModel? get movie => movieDetailsModel;

  Future<Either<MovieError, MovieDetailModel>> fetchMovie(int id) async {
    final result = await _repository.fetchMovieById(id);
    result.fold(
        (error) => movieError = error, (movie) => movieDetailsModel = movie);
    return result;
  }
}
