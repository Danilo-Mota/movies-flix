import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_host.dart';
import 'endpoint.dart';

typedef Success = void Function(dynamic result);
typedef Failure = void Function(DioError error);

class ApiProvider {
  final Dio _dio = Dio()..interceptors.add(PrettyDioLogger());

  Future<void> request({required Endpoint endpoint, Success? success, Failure? failure}) async {
    _dio.options.method = endpoint.method;
    _dio.options.baseUrl = ApiHost.baseURL;
    _dio.options.queryParameters = endpoint.queryParameters;
    _dio.options.contentType = endpoint.contentType ?? ContentType.json.value;

    try {
      final response = await _dio.request(
        endpoint.path,
        data: endpoint.data,
        queryParameters: endpoint.queryParameters,
      );
      success?.call(response.data);
    } on DioError catch (error) {
      failure?.call(error);
    }
  }
}
