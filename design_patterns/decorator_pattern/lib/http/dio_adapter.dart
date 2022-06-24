import 'package:decorator_pattern/http/http_client.dart';
import 'package:dio/dio.dart';

import 'http_response.dart';

class DioAdapter extends HttpClient {
  final Dio dio;

  DioAdapter({
    required this.dio,
  });

  @override
  Future<HttpResponse> request({
    required HttpMethod method,
    required String path,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.request(
      path,
      data: body,
      options: Options(
        method: method.toString(),
        headers: headers,
      ),
      queryParameters: queryParameters,
    );

    return HttpResponse(
      body: response.data,
      statusCode: response.statusCode ?? 0,
    );
  }
}
