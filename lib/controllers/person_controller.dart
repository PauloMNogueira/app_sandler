import 'package:adam_sandler/errors/person_error.dart';
import 'package:adam_sandler/models/person_model.dart';
import 'package:adam_sandler/repositories/person_repository.dart';
import 'package:dartz/dartz.dart';

class PersonController {
  final _repository = PersonRepository();
  PersonModel? personModel;
  late PersonError personError;
  late bool loading = true;

  Future<Either<PersonError, PersonModel>> fetchPerson() async {
    final result = await _repository.fetchPerson();
    result.fold((error) => personError = error, (person) {
      personModel = person;
    });
    return result;
  }

  String splitBiography() {
    if (personModel!.biography.length > 300) {
      return '${personModel!.biography.substring(0, 347)}...';
    }
    return personModel!.biography;
  }
}
