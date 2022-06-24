import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:decorator_pattern/errors/errors.dart';
import 'package:decorator_pattern/http/http_client_decorator.dart';
import 'package:decorator_pattern/http/http_response.dart';

import 'http_client.dart';

class CheckConnectionDecorator extends HttpClientDecorator {
  CheckConnectionDecorator(super.client);

  @override
  Future<HttpResponse> request({
    required HttpMethod method,
    required String path,
    body,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!(await isConnected)) {
      throw NoConnectionError();
    }

    return super.request(
      method: method,
      path: path,
      body: body,
      headers: headers,
      queryParameters: queryParameters,
    );
  }

  Future<bool> get isConnected async {
    final connectivity = Connectivity();
    final result = await connectivity.checkConnectivity();

    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      return true;
    }
    return false;
  }
}
