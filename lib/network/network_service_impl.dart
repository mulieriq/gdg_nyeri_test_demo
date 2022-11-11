import 'package:dio/dio.dart';

import 'network_service.dart';
import 'rest_client.dart';

class NetworkServiceImpl implements NetworkService {
  final RestClient _restClient;
  NetworkServiceImpl(this._restClient);

  @override
  Future<Map<String, dynamic>> getHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    bool tokenRequired = false,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _restClient.dio.get(
        endpoint,
        queryParameters: params,
        options: Options(
          extra: {'token-required': tokenRequired},
          headers: headers,
        ),
      );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response!);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> postHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    dynamic body,
    Map<String, dynamic>? headers,
    bool tokenRequired = true,
  }) async {
    try {
      final response = await _restClient.dio.post(
        endpoint,
        queryParameters: params,
        data: body,
        options: Options(
          extra: {
            'token-required': tokenRequired,
          },
          headers: headers,
        ),
      );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response!);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> putHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool isPatch = false,
    bool? tokenRequired = true,
  }) async {
    try {
      final response = isPatch
          ? await _restClient.dio.patch(
              endpoint,
              queryParameters: params,
              data: body,
              options: Options(
                extra: {'token-required': tokenRequired},
                headers: headers,
              ),
            )
          : await _restClient.dio.put(
              endpoint,
              queryParameters: params,
              data: body,
              options: Options(
                extra: {'token-required': tokenRequired},
                headers: headers,
              ),
            );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response!);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  @override
  Future<Map<String, dynamic>> deleteHttp(
    String endpoint, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool tokenRequired = true,
  }) async {
    try {
      final response = await _restClient.dio.delete(
        endpoint,
        queryParameters: params,
        data: body,
        options: Options(
          extra: {'token-required': tokenRequired},
          headers: headers,
        ),
      );

      return _handleApiResponse(response);
    } on DioError catch (e) {
      return _handleApiResponse(e.response!);
    } catch (e) {
      return <String, dynamic>{
        'error': ApiErrors.failure,
        'message': e.toString(),
      };
    }
  }

  Map<String, dynamic> _handleApiResponse(Response response) {
    if (response.statusCode! / 200 >= 1 && response.statusCode! / 200 < 1.5) {
      if (response.data is Map && (response.data as Map).containsKey('data')) {
        return response.data as Map<String, dynamic>;
      }

      if ((response.data as Map)['success'] == false) {
        return <String, dynamic>{
          'error': ApiErrors.failure,
          'message': (response.data as Map).containsKey('errors')
              ? (response.data as Map)['errors'].toString()
              : (response.data as Map)['message'],
        };
      }

      return <String, dynamic>{'data': response.data};
    }

    final errorResult = <String, dynamic>{
      'message': '${response.data['message']}',
      'data': response.data,
    };

    switch (response.statusCode) {
      case 400:
        errorResult['error'] = ApiErrors.badRequest;
        break;
      case 401:
        errorResult['error'] = ApiErrors.unauthenticated;
        break;
      case 403:
        errorResult['error'] = ApiErrors.notPermitted;
        break;
      case 404:
        errorResult['error'] = ApiErrors.notFound;
        break;
      case 422:
        errorResult['error'] = ApiErrors.validationFailed;
        break;
      case 500:
        errorResult['error'] = ApiErrors.serverError;
        break;
      default:
        errorResult['error'] = ApiErrors.unknown;
    }

    assert(errorResult['error'] != null);
    assert(errorResult['error'] is ApiErrors);

    assert(errorResult['message'] != null);
    assert(errorResult['message'] is String);

    return errorResult;
  }
}

enum ApiErrors {
  serverError,
  badRequest,
  notFound,
  validationFailed,
  unauthenticated,
  notPermitted,
  unknown,
  noInternet,
  failure,
}
