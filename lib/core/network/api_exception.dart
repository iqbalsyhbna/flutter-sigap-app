import 'package:dio/dio.dart';
import 'package:sigap_mobile/core/network/api_message.dart';
import 'package:sigap_mobile/data/model/base_response.dart';

class DioException {
  static message(DioError dioError) {
    if (dioError.type == DioErrorType.connectTimeout) {
      return 'Request timeout';
    } else {
      switch (dioError.response?.statusCode) {
        case 301:
          return ApiMessage.message("Situs dialihkan!");
        case 400:
          return ApiMessage.message(
              ApiResponse.fromJson(dioError.response?.data).message!);
        case 401:
          return ApiMessage.message("Anda harus login terlebih dahulu.");
        case 404:
          return ApiMessage.message(
              "Alamat tidak ditemukan: ${dioError.response?.statusCode}");
        case 422:
          return ApiMessage.message(
              "Permintaan Ditolak, pesan: ${dioError.response?.statusMessage}");
        case 500:
          return ApiMessage.message(
              "Mohon maaf, terjadi kesalahan pada Server.");
        case 502:
          return ApiMessage.message(
              "Mohon maaf, terjadi kesalahan pada Server.");
        default:
          return "Terjadi kesalahan! \n(${dioError.response?.statusCode} : ${dioError.response?.statusMessage})";
      }
    }
  }
}
