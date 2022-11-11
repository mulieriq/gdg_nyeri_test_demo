import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdg_nyeri_demo/network/rest_client.dart';

void main() {
  group('Rest Client Test', () {
    late RestClient restClient;

    setUp(() {
      restClient = RestClient();
    });

    test(
      """Given an instance of Rest client [none-mocked]
      When Restclient is intantieted
      Then a Dio instance is returned""",
      () async {
        var dio = restClient.dio;
        expect(dio, isA<Dio>());
      },
    );

    test(
      """Given an intance of Rest Client [none-mocked]
      When Restclient is intantieted
           Then a Dio instance is returned with option
       """,
      () async {
        //Arrange
        var dio = restClient.dio;
        //Act

        var xWwwFormUrlencoded = dio.options.headers
            .containsValue('application/x-www-form-urlencoded');
        var acceptsJson = dio.options.headers.containsValue('application/json');
        var baseUrl = dio.options.baseUrl.contains('someurl');

        // ASSERT

        expect(xWwwFormUrlencoded, true);
        expect(acceptsJson, true);
        expect(baseUrl, true);
      },
    );

    test(
      """Given an intance of Rest Client [none-mocked]
      When Restclient is intantieted
           Then a Dio instance is returned with http formatter in dev mode
       """,
      () async {
        //Arrange
        var dio = restClient.dio;
        //Act

        var debugHasHttpFormatter =
            dio.interceptors.firstWhere((element) => element is HttpFormatter);
        // ASSERT

        expect(debugHasHttpFormatter, isA<HttpFormatter>());
      },
    );

    test(
      """Given an intance of Rest Client [none-mocked]
      When Restclient is intantieted
      Then a Dio instance is returned with extra-options
       """,
      () async {
        //Arrange
        var dio = restClient.dio;
        dio.options.extra = {"token_required": true};
        //Act

        var containsTokenRequired =
            dio.options.extra.containsKey("token_required");
        var tokenRequired = dio.options.extra["token_required"];
        // ASSERT

        expect(containsTokenRequired, true);
        expect(tokenRequired, true);
      },
    );

    test(
      """Given an intance of Rest Client [none-mocked]
      When Rest-client is intantieted
      Then a Dio instance is returned with  Authorization Bearer and tokemn
       """,
      () async {
        //Arrange
        var dio = restClient.dio;
        dio.options.extra = {"token_required": true};
        //Act

        var tokenRequired = dio.options.extra["token_required"];

        if (tokenRequired) {
          var token = 'token';
          dio.options.headers.addAll({
            "Authorization": "Bearer $token",
          });
        }

        var containsAuthorization =
            dio.options.headers.containsKey("Authorization");

        // ASSERT

        expect(containsAuthorization, true);

        if (dio.options.headers["Authorization"] is String) {
          bool isbearer = dio.options.headers["Authorization"]
              .toString()
              .contains("Bearer");

          expect(isbearer, true);
        }

        if (dio.options.headers["Authorization"] is String) {
          bool hastoken =
              dio.options.headers["Authorization"].toString().contains("token");

          expect(hastoken, true);
        }
      },
    );
  });
}
