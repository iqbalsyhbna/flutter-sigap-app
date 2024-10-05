import 'package:sigap_mobile/data/model/account.dart';
import 'package:sigap_mobile/data/model/base_response.dart';

abstract class AuthDataSource {
  Future<ApiResponse<Account>> login({required String username, required String password});
}
