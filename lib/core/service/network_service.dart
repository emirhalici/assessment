import 'package:dio/dio.dart';

import '../model/response_model.dart';

typedef FromMap<T extends Object> = T Function(Object object);

abstract class INetworkService {
  Future<ResponseModel<T>> postMethod<T extends Object>(
      {required String path,
      required Map<String, dynamic>? body,
      required Map<String, dynamic>? queryParameter,
      required FromMap<T>? fromMap});
}

class NetworkService implements INetworkService {
  final Dio _client;

  NetworkService(this._client);

  @override
  Future<ResponseModel<T>> postMethod<T extends Object>(
      {required String path,
      required Map<String, dynamic>? body,
      required Map<String, dynamic>? queryParameter,
      required FromMap<T>? fromMap}) async {
    try {
      final response = await _client.post(path, data: body, queryParameters: queryParameter);

      if (response.statusCode == 200) {
        return ResponseModel(
          status: true,
          statusCode: response.statusCode,
          errorMessage: null,
          rawResponse: response.data,
          model: fromMap == null ? response.data : fromMap(response.data),
        );
      }

      return ResponseModel(
        status: false,
        statusCode: response.statusCode,
        errorMessage: null,
        rawResponse: response.data,
        model: null,
      );
    } on DioError catch (exception) {
      return ResponseModel(
        status: false,
        statusCode: exception.response?.statusCode,
        errorMessage: exception.message,
        rawResponse: exception.response?.data,
        model: null,
      );
    } catch (generalException) {
      return ResponseModel(status: false, statusCode: null, errorMessage: null, rawResponse: null, model: null);
    }
  }
}
