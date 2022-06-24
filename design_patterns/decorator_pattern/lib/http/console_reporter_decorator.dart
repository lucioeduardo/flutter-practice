import 'package:decorator_pattern/http/http_client_decorator.dart';
import 'package:decorator_pattern/http/http_response.dart';
import 'package:flutter/cupertino.dart';

import 'http_client.dart';

class ConsoleReporterDecorator extends HttpClientDecorator {
  ConsoleReporterDecorator(super.client);

  @override
  Future<HttpResponse> request({
    required HttpMethod method,
    required String path,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    _printRequest(
      method: method,
      path: path,
      headers: headers,
      body: body,
      queryParameters: queryParameters,
    );

    final response = await super.request(
      method: method,
      path: path,
      body: body,
      headers: headers,
      queryParameters: queryParameters,
    );

    _printResponse(response);

    return response;
  }

  void _printRequest({
    required HttpMethod method,
    required String path,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint('========== $method Request ==========');
    debugPrint('=== Path: $path');
    debugPrint('=== headers: $headers');
    if (body != null) {
      debugPrint('=== Body: $body');
    }
    debugPrint('=== queryParameters: $queryParameters');
    debugPrint('=====================================');
  }

  void _printResponse(HttpResponse response) {
    debugPrint('========== Response ==========');
    debugPrint('=== Status Code: ${response.statusCode}');
    debugPrint('=== Body: ${response.body}');
  }
}
