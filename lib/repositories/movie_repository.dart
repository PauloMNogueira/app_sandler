import 'package:adam_sandler/core/api.dart';
import 'package:adam_sandler/errors/movies_error.dart';
import 'package:adam_sandler/models/movie_details_model.dart';
import 'package:adam_sandler/models/movies_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final Dio _dio = Dio(kDioOptions);

  Future<Either<MovieError, MovieResponseModel>> fetchAllMovies() async {
    try {
      final response = await _dio.get('/person/19292/movie_credits');
      print(
          [">>>>>>>>>>>", response.data["cast"][0]['title'], "<<<<<<<<<<<<<"]);
      final model = MovieResponseModel.fromMap(response.data);
      print([model, "MODEL"]);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(kServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }

  Future<Either<MovieError, MovieDetailModel>> fetchMovieById(int id) async {
    try {
      final response = await _dio.get("/movie/$id");
      print(response);
      final model = MovieDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            MovieRepositoryError(error.response!.data['status_message']));
      } else {
        return Left(MovieRepositoryError(kServerError));
      }
    } on Exception catch (error) {
      return Left(MovieRepositoryError(error.toString()));
    }
  }
}
