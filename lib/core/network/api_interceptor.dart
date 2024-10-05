import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiInterceptors extends Interceptor {
  Dio? _dio;
  ApiInterceptors(this._dio);

  @override
  Future<dynamic> onRequest(options, handler) async {
    debugPrint("Interceptor ON REQUEST");
    debugPrint("--> ${options.method.toUpperCase()}");
    options.headers.forEach((key, value) => debugPrint("Headers : $key: $value"));
    options.queryParameters.forEach((key, value) => debugPrint("queryParameters : $key: $value"));
    if (options.data != null) {
      debugPrint("Body: ${options.data}");
    }
    debugPrint("--> END ${options.method.toUpperCase()}");
    return super.onRequest(options, handler);
  }

  @override
  Future<dynamic> onResponse(Response response, handler) async {
    debugPrint("Interceptor ON RESPONSE");
    debugPrint("<-- ${(response.requestOptions.baseUrl + response.requestOptions.path)}");
    debugPrint("Satus Code : ${response.statusCode} ");
    response.headers.forEach((key, value) => debugPrint("Headers : $key: $value"));
    debugPrint("Response: ${response.data}");
    debugPrint("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioError err, handler) async {
    debugPrint("Interceptor ON ERROR");
    debugPrint("<-- ${err.response?.requestOptions.baseUrl}, ${err.response?.requestOptions.path}");
    debugPrint("Status Code : ${err.response?.statusCode} ");
    debugPrint("Error Message : ${err.response?.statusMessage} ");
    debugPrint("Error Message : ${err.message} ");
    debugPrint("<-- End error");

    super.onError(err, handler);
  }
}