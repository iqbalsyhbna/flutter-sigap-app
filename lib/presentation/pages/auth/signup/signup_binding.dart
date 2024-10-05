import 'package:get/get.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource_impl.dart';
import 'package:sigap_mobile/presentation/pages/auth/signup/signup_controller.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController(dataSource: AuthDataSourceImpl()));
  }
}
