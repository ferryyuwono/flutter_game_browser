import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

enum RestMethod { get, post, put, patch, delete }

@LazySingleton()
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
    final response = await _requestByMethod<T>(
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

  Future<Response<T>> _requestByMethod<T>({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    // ignore: avoid-dynamic
    dynamic body,
    Options? options,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get<T>(
          path,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.post:
        return dio.post<T>(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.patch:
        return dio.patch<T>(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.put:
        return dio.put<T>(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.delete:
        return dio.delete<T>(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
