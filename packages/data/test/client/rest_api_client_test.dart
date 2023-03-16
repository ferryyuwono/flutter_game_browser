import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class StringResponseMapper extends ResponseMapper<String> {
  @override
  String map(response) {
    return response.toString();
  }
}

void main() {
  group('RestApiClient', () {
    final RestApiClient restApiClient = RestApiClient();
    final dioAdapter = DioAdapter(dio: restApiClient.dio);
    final stringResponseMapper = StringResponseMapper();

    setUp(() {});

    test('when get request is called, should return response', () async {
      // Given
      final response = {};
      dioAdapter.onGet('', (server) =>
          server.reply(
            200,
            response,
          )
      );

      // When
      final result = restApiClient.request<String>(
        method: RestMethod.get,
        path: '',
        responseMapper: stringResponseMapper
      );

      // Expect
      expect(result, completion(response.toString()));
    });
    test('when post request is called, should return response', () async {
      // Given
      final response = {};
      dioAdapter.onPost('', (server) =>
          server.reply(
            200,
            response,
          )
      );

      // When
      final result = restApiClient.request<String>(
          method: RestMethod.post,
          path: '',
          responseMapper: stringResponseMapper
      );

      // Expect
      expect(result, completion(response.toString()));
    });
    test('when put request is called, should return response', () async {
      // Given
      final response = {};
      dioAdapter.onPut('', (server) =>
          server.reply(
            200,
            response,
          )
      );

      // When
      final result = restApiClient.request<String>(
          method: RestMethod.put,
          path: '',
          responseMapper: stringResponseMapper
      );

      // Expect
      expect(result, completion(response.toString()));
    });
    test('when patch request is called, should return response', () async {
      // Given
      final response = {};
      dioAdapter.onPatch('', (server) =>
          server.reply(
            200,
            response,
          )
      );

      // When
      final result = restApiClient.request<String>(
          method: RestMethod.patch,
          path: '',
          responseMapper: stringResponseMapper
      );

      // Expect
      expect(result, completion(response.toString()));
    });
    test('when delete request is called, should return response', () async {
      // Given
      final response = {};
      dioAdapter.onDelete('', (server) =>
          server.reply(
            200,
            response,
          )
      );

      // When
      final result = restApiClient.request<String>(
          method: RestMethod.delete,
          path: '',
          responseMapper: stringResponseMapper
      );

      // Expect
      expect(result, completion(response.toString()));
    });

    tearDown(() {});
  });
}
