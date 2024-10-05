import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sigap_mobile/core/database/get_storage.dart';
import 'package:sigap_mobile/core/network/api_config.dart';
import 'package:sigap_mobile/core/network/api_exception.dart';
import 'package:sigap_mobile/core/network/api_message.dart';
import 'package:sigap_mobile/data/model/base_response.dart';

enum RequestMethod { GET, POST, PATCH, PUT, DELETE }

Map<String, String> headers = {
  HttpHeaders.authorizationHeader: "",
  "Client-Token": "EY5WGBIXosmK5f2Jckxt52Gm9p8sv1VEMjYzozArzb0=",
};

Future<ApiResponse> sendRequest({
  required String url,
  Object? body,
  required RequestMethod requestMethod,
  bool useAuth = false,
  String? contentType = Headers.jsonContentType,
}) async {
  // var apiToken = getxStorage.isLoggedIn() ? _localDatabaseService.getApiToken() : null;
  if(useAuth) {
    headers[HttpHeaders.authorizationHeader] = "Bearer apiToken";
  }
  ApiResponse response;
  switch (requestMethod) {
    case RequestMethod.POST:
      try {
        final responseBody = await dioClient.post(url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body as Map<String, dynamic>),
            options: Options(headers: headers, contentType: contentType));
        response = ApiResponse(
          success: true,
          // data: responseBody.data,
          data: ApiResponse.fromJson(responseBody.data).data,
        );
      } on SocketException {
        response = ApiResponse(
          success: false,
          message: ApiMessage.message("Tidak ada koneksi internet!"),
        );
      } on DioError catch (error) {
        response = ApiResponse(
          success: false,
          message: DioException.message(error),
        );
      }
      break;
    case RequestMethod.GET:
      try {
        final responseBody = await dioClient.get(url,
            options: Options(headers: headers, contentType: contentType));
        response = ApiResponse(success: true, data: responseBody.data);
      } on SocketException {
        response = ApiResponse(
            success: false,
            message: ApiMessage.message("Tidak ada koneksi internet!"));
      } on DioError catch (error) {
        response =
            ApiResponse(success: false, message: DioException.message(error));
      }
      break;
    case RequestMethod.PATCH:
      try {
        final responseBody = await dioClient.patch(url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body as Map<String, dynamic>),
            options: Options(headers: headers, contentType: contentType));
        response = ApiResponse(
          success: true,
          data: responseBody.data,
        );
      } on SocketException {
        response = ApiResponse(
          success: false,
          message: ApiMessage.message("Tidak ada koneksi internet!"),
        );
      } on DioError catch (error) {
        response = ApiResponse(
          success: false,
          message: DioException.message(error),
        );
      }
      break;
    case RequestMethod.PUT:
      try {
        final responseBody = await dioClient.put(url,
            data: contentType == Headers.jsonContentType
                ? jsonEncode(body)
                : FormData.fromMap(body as Map<String, dynamic>),
            options: Options(headers: headers, contentType: contentType));
        response = ApiResponse(
          success: true,
          data: responseBody.data,
        );
      } on SocketException {
        response = ApiResponse(
          success: false,
          message: ApiMessage.message("Tidak ada koneksi internet!"),
        );
      } on DioError catch (error) {
        response = ApiResponse(
          success: false,
          message: DioException.message(error),
        );
      }
      break;
    case RequestMethod.DELETE:
      try {
        final responseBody =
            await dioClient.delete(url, options: Options(headers: headers));
        response = ApiResponse(
          success: true,
          data: responseBody.data,
        );
      } on SocketException {
        response = ApiResponse(
          success: false,
          message: ApiMessage.message("Tidak ada koneksi internet!"),
        );
      } on DioError catch (error) {
        response = ApiResponse(
          success: false,
          message: DioException.message(error),
        );
      }
      break;
  }
  return response;
}
