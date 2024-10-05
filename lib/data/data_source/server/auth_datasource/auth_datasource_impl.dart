import 'package:dio/dio.dart';
import 'package:sigap_mobile/core/network/api_request.dart';
import 'package:sigap_mobile/core/app/app_constants.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource.dart';
import 'package:sigap_mobile/data/model/account.dart';
import 'package:sigap_mobile/data/model/auth.dart';
import 'package:sigap_mobile/data/model/base_response.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<ApiResponse<Account>> login({required String username, required String password}) async {
    final response = await sendRequest(
      url: 'login',
      useAuth: false,
      requestMethod: RequestMethod.POST,
      contentType: Headers.jsonContentType,
      body: {
        "username": username,
        "password": password,
        "fcm_token": fcmToken,
      },
    );
    if (response.success) {
      return ApiResponse(
        success: true,
        data: Auth.fromJson(response.data).account,
      );
    } else {
      return ApiResponse(
        success: false,
        message: response.message,
      );
    }
  }
}
