import 'package:decorator_pattern/http/http_response.dart';

enum HttpMethod {
  get,
  post,
  put,
  delete;

  @override
  String toString() {
    return name.toUpperCase();
  }
}

abstract class HttpClient {
  Future<HttpResponse> get(
    String path, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) {
    return request(
      method: HttpMethod.get,
      path: path,
      headers: headers,
      queryParameters: queryParameters,
    );
  }

  Future<HttpResponse> post(
    String path, {
    body,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) {
    return request(
      method: HttpMethod.post,
      path: path,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
    );
  }

  Future<HttpResponse> put(
    String path, {
    body,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) {
    return request(
      method: HttpMethod.get,
      path: path,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
    );
  }

  Future<HttpResponse> delete(
    String path, {
    body,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> headers = const {},
  }) {
    return request(
      method: HttpMethod.get,
      path: path,
      headers: headers,
      queryParameters: queryParameters,
      body: body,
    );
  }

  Future<HttpResponse> request({
    required HttpMethod method,
    required String path,
    dynamic body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });
}
