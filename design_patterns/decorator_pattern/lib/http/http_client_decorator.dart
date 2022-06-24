import 'package:decorator_pattern/http/http_client.dart';

import 'http_response.dart';

class HttpClientDecorator extends HttpClient {
  final HttpClient client;

  HttpClientDecorator(
    this.client,
  );

  @override
  Future<HttpResponse> request({
    required HttpMethod method,
    required String path,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) {
    return client.request(
      method: method,
      path: path,
      body: body,
      headers: headers,
      queryParameters: queryParameters,
    );
  }
}
