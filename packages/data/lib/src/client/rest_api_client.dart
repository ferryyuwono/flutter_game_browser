import 'package:dio/dio.dart';

import '../../data.dart';

enum RestMethod { get, post, put, patch, delete }

class RestApiClient {
  final String baseUrl;
  final List<Interceptor> interceptors;
  final Dio dio;

  RestApiClient({
    this.baseUrl = '',
    this.interceptors = const [],
    int connectTimeoutInMs = 30000,
    int sendTimeoutInMs = 30000,
    int receiveTimeoutInMs = 30000,
  }) : dio = Dio(
    BaseOptions(
      connectTimeout: Duration(milliseconds: connectTimeoutInMs),
      receiveTimeout: Duration(milliseconds: receiveTimeoutInMs),
      sendTimeout: Duration(milliseconds: sendTimeoutInMs),
      baseUrl: baseUrl,
    ),
  ) {
    dio.interceptors.addAll(interceptors);
  }

  Future<T> request<T>({
    required RestMethod method,
    required String path,
    required ResponseMapper<T> responseMapper,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, dynamic>? headers,
    String? contentType,
    ResponseType? responseType,
    int sendTimeoutInMs = 30000,
    int receiveTimeoutInMs = 30000,
  }) async {
    final response = await _requestByMethod(
      method: method,
      path: path.startsWith(baseUrl) ? path.substring(baseUrl.length) : path,
      queryParameters: queryParameters,
      body: body,
      options: Options(
        headers: headers,
        contentType: contentType,
        responseType: responseType,
        sendTimeout: Duration(milliseconds: sendTimeoutInMs),
        receiveTimeout: Duration(milliseconds: receiveTimeoutInMs),
      ),
    );

    return responseMapper.map(response.data);
  }

  Future<Response> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    // ignore: avoid-dynamic
    dynamic body,
    Options? options,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get(
          path,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.post:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.put:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
