import 'package:dio/dio.dart';
import 'package:gdg_nyeri_demo/network/network_service_impl.dart';
import 'package:gdg_nyeri_demo/network/rest_client.dart';
import 'package:gdg_nyeri_demo/repository/url_launcher_repository.dart';
import 'package:gdg_nyeri_demo/wrapper/url_launcher_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../network/network_service_impl_test.dart';

class MockUrlLauncher extends Mock implements UrlLauncherRepository {}

class MockUrlLauncherService extends Mock implements UrlLauncherService {}

class MockRestClient extends Mock implements RestClient {
  var _dio = Dio(BaseOptions());

  mockGetSuccess({Map<String, dynamic>? data, bool testNullResponse = false}) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onGet(
      BASE_URL,
      (server) => server.reply(
        200,
        data,
        delay: const Duration(seconds: 1),
      ),
    );

    _dio;
  }

  mockGetError() {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onGet(
        BASE_URL,
        (server) => server.throws(
              400,
              DioError(
                response: Response(
                  statusCode: 400,
                  data: NetworkMockData.getData,
                  requestOptions: RequestOptions(
                    path: BASE_URL,
                  ),
                ),
                requestOptions: RequestOptions(
                  path: BASE_URL,
                ),
              ),
            ));

    _dio;
  }

  mockPostSuccess({Map<String, dynamic>? data}) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPost(
      BASE_URL,
      (server) => server.reply(
        200,
        data,
        delay: const Duration(seconds: 1),
      ),
    );

    _dio;
  }

  mockPostError() {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPost(
        BASE_URL,
        (server) => server.throws(
              400,
              DioError(
                response: Response(
                  statusCode: 400,
                  data: NetworkMockData.postData,
                  requestOptions: RequestOptions(
                    path: BASE_URL,
                  ),
                ),
                requestOptions: RequestOptions(
                  path: BASE_URL,
                ),
              ),
            ));

    _dio;
  }

  mockPutSuccess({Map<String, dynamic>? data}) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPut(
      BASE_URL,
      (server) => server.reply(
        200,
        data,
        delay: const Duration(seconds: 1),
      ),
    );

    _dio;
  }

  mockPatchSuccess({Map<String, dynamic>? data}) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPatch(
      BASE_URL,
      (server) => server.reply(
        200,
        data,
        delay: const Duration(seconds: 1),
      ),
    );

    _dio;
  }

  mockPutError() {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onPut(
        BASE_URL,
        (server) => server.throws(
              400,
              DioError(
                response: Response(
                  statusCode: 400,
                  data: NetworkMockData.putData,
                  requestOptions: RequestOptions(
                    path: BASE_URL,
                  ),
                ),
                requestOptions: RequestOptions(
                  path: BASE_URL,
                ),
              ),
            ));

    _dio;
  }

  mockDeleteSuccess({Map<String, dynamic>? data}) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onDelete(
      BASE_URL,
      (server) => server.reply(
        200,
        data,
        delay: const Duration(seconds: 1),
      ),
    );

    _dio;
  }

  mockDeleteError() {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onDelete(
        BASE_URL,
        (server) => server.throws(
              400,
              DioError(
                response: Response(
                  statusCode: 400,
                  data: NetworkMockData.deleteData,
                  requestOptions: RequestOptions(
                    path: BASE_URL,
                  ),
                ),
                requestOptions: RequestOptions(
                  path: BASE_URL,
                ),
              ),
            ));

    _dio;
  }

  mockStatusCodeError(int statusCode) {
    _dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: _dio);
    _dio.httpClientAdapter = dioAdapter;
    dioAdapter.onDelete(
        BASE_URL,
        (server) => server.throws(
              statusCode,
              DioError(
                response: Response(
                  statusCode: statusCode,
                  data: NetworkMockData.deleteData,
                  requestOptions: RequestOptions(
                    path: BASE_URL,
                  ),
                ),
                requestOptions: RequestOptions(
                  path: BASE_URL,
                ),
              ),
            ));

    _dio;
  }

  @override
  Dio get dio => _dio;
}

class NetworkMockData {
  static Map<String, dynamic> getData = {
    "data": {"get": "received"}
  };

  static Map<String, dynamic> getDataError = {
    'message': 'null',
    'data': {
      'data': {'get': 'received'}
    },
    'error': ApiErrors.badRequest
  };
  static Map<String, dynamic> postData = {
    "data": {"post": "posted"}
  };

  static Map<String, dynamic> postDataError = {
    'message': 'null',
    'data': {
      "data": {"post": "posted"}
    },
    'error': ApiErrors.badRequest
  };
  static Map<String, dynamic> putData = {
    "data": {"put": "updated"}
  };

  static Map<String, dynamic> putDataError = {
    'message': 'null',
    'data': {
      "data": {"put": "updated"}
    },
    'error': ApiErrors.badRequest
  };
  static Map<String, dynamic> deleteData = {
    "data": {"delete": "deleted"}
  };
  static Map<String, dynamic> deleteDataError = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.badRequest
  };

  static Map<String, dynamic> customErrorData = {
    'error': ApiErrors.failure,
    'message':
        'type \'Null\' is not a subtype of type \'Map<dynamic, dynamic>\' in type cast'
  };

  static Map<String, dynamic> deleteDataError401 = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.unauthenticated
  };

  static Map<String, dynamic> deleteDataError403 = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.notPermitted
  };

  static Map<String, dynamic> deleteDataError404 = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.notFound
  };

  static Map<String, dynamic> deleteDataError422 = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.validationFailed
  };
  static Map<String, dynamic> deleteDataError500 = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.serverError
  };

  static Map<String, dynamic> deleteDataErrorUnknown = {
    'message': 'null',
    'data': {
      "data": {"delete": "deleted"}
    },
    'error': ApiErrors.unknown
  };
}
