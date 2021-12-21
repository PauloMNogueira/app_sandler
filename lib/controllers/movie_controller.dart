import 'package:adam_sandler/errors/movies_error.dart';
import 'package:adam_sandler/models/movies_model.dart';
import 'package:adam_sandler/models/movies_response_model.dart';
import 'package:adam_sandler/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieController {
  final _repository = MovieRepository();
  MovieResponseModel? movieResponseModel;
  late MovieError movieError;
  late bool loading = true;
  late int moviesCount = movieResponseModel!.movies!.length;

  List<MovieModel> get movies => movieResponseModel!.movies ?? <MovieModel>[];

  Future<Either<MovieError, MovieResponseModel>> fetchMovies() async {
    final result = await _repository.fetchAllMovies();
    result.fold(
        (error) => movieError = error, (movies) => movieResponseModel = movies);
    return result;
  }
}
