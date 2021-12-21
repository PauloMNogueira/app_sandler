import 'package:adam_sandler/core/api.dart';
import 'package:adam_sandler/errors/person_error.dart';
import 'package:adam_sandler/models/person_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PersonRepository {
  Dio _dio = Dio(kDioOptions);
  PersonRepository({Dio? dio}) {
    _dio = dio ?? Dio(kDioOptions);
  }

  Future<Either<PersonError, PersonModel>> fetchPerson() async {
    try {
      final response = await _dio.get('/person/19292');
      print(["RESPONSE", response]);
      final model = PersonModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      print(['Erro ==>', error]);
      if (error.response != null) {
        return Left(
            PersonRepositoryError(error.response!.data["status_message"]));
      } else {
        return Left(PersonRepositoryError(kServerError));
      }
    } on Exception catch (error) {
      return Left(PersonRepositoryError(error.toString()));
    }
  }
}
