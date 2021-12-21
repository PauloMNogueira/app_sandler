// import 'package:adam_sandler/core/api.dart';
// import 'package:adam_sandler/repositories/person_repository.dart';
// import 'package:dio/dio.dart';

import 'package:adam_sandler/core/api.dart';
import 'package:adam_sandler/repositories/person_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../setup/person_api_mock.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  setUp(() {
    dio.httpClientAdapter = dioAdapter;
  });
  group("Testing Person Model", () {
    test("Should return correct Person Model", () async {
      dioAdapter.onGet(
          "/person/19292", (request) => request.reply(200, personMock));
      final _personRepository = PersonRepository(dio: dio);
      final result = await _personRepository.fetchPerson();
      expect(result.isRight(), equals(true));
    });

    test("Should return exception", () async {
      dioAdapter.onGet(
          "$kApiKey/person/19292", (request) => request.reply(404, {}));
      final _personRepository = PersonRepository(dio: dio);
      final result = await _personRepository.fetchPerson();
      expect(result.isLeft(), equals(true));
    });
  });
}
