import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:sigap_mobile/core/app/app_constants.dart';
import 'package:sigap_mobile/core/network/api_config.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource_impl.dart';
import 'package:sigap_mobile/data/model/account.dart';
import 'package:sigap_mobile/data/model/base_response.dart';

void main() {

  const baseURL = "https://ulak.gradien.co/api/";
  const loginURL = "login";
  const wrongCredential = "Maaf, username atau password yang Anda masukkan salah.";

  group('Login Data Source', () {
    late Dio dio;
    late DioAdapter mockDioAdapter;

    setUp((){
       dio = Dio(BaseOptions(baseUrl: baseURL));
       mockDioAdapter = DioAdapter(dio: dio);
       Get.lazyPut(() => DioClientServices());
    });

    tearDown(() {
      mockDioAdapter.close();
    });

    test('''Should perform POST Login in Host and returns 
    AuthModel include AccountModel and message is empty''', () async {

      const String username = "admin";
      const String password = "waykanan123";
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
        HttpHeaders.authorizationHeader: "",
        "Client-Token": "EY5WGBIXosmK5f2Jckxt52Gm9p8sv1VEMjYzozArzb0=",
      };

      when(mockDioAdapter.onPost(loginURL,(server) { server.reply(200, {'''
      {
        "success": true,
        "message": "Berhasil Masuk!",
        "data": {
          "user": {
            "id": 2,
            "name": "User",
            "username": "user",
            "email": "user@user.com"
          },
          "token": "11|FDpEO0dJk3MuNuB2kk7aVbu7jGDxfFBjsUfVsikf"
        }
      }
      '''});},
        data: {
          "username" : username,
          "password" : password,
          "fcm_token" : fcmToken,
        },
        headers: headers
      ));
      var dataSource = await AuthDataSourceImpl().login(username: username, password: password);
      expect(dataSource, isA<ApiResponse<Account>>());
    });

    test('''Should perform POST Login with invalid credential
    Should reply 400 and return ErrorMessage''', () async {
      const String username = "false";
      const String password = "false";
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: Headers.formUrlEncodedContentType,
        HttpHeaders.authorizationHeader: "",
        "Client-Token": "EY5WGBIXosmK5f2Jckxt52Gm9p8sv1VEMjYzozArzb0=",
      };

      when(mockDioAdapter.onPost(loginURL ,(server) => server.throws(400, DioError(
          requestOptions: RequestOptions(
            path: loginURL,
            ),
        type: DioErrorType.response
          ),),
          data: {
            "username" : username,
            "password" : password,
            "fcm_token" : fcmToken,
          },
          headers: headers
      ));
      var dataSource = await AuthDataSourceImpl().login(username: username, password: password);
      expect(dataSource.message, equals(wrongCredential));
    });
  });
}