import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';

class RestClient {
  late Dio _dio;
  Dio get dio => _dio;

  RestClient() {
    _dio = create();
  }

  Dio create() {
    Dio dio = Dio();

    kDebugMode ? dio.interceptors.add(HttpFormatter()) : null;
    dio.options.headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    dio.options.headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    dio.options.baseUrl = 'someurl';
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (options.extra['token-required'] == true) {
        var token = 'token';
        options.headers.addAll({
          "Authorization": "Bearer $token",
        });
      }
      return handler.next(options);
    }));

    return dio;
  }
}
