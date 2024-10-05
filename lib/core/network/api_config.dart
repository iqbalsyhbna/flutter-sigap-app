import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sigap_mobile/core/network/api_interceptor.dart';

final Dio dioClient = Get.find<DioClientServices>().init();

class DioClient {
  static const baseURL = "https://ulak.gradien.co/api/";

  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors(_dio));
    _dio.options.baseUrl = baseURL;
    _dio.options.connectTimeout = 60 * 1000; //60s
    _dio.options.receiveTimeout = 3 * 1000; //3s
    return _dio;
  }
}

class DioClientServices {
  init() => DioClient().init();
}



