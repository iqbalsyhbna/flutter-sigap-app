import 'package:get/get.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource_impl.dart';
import 'package:sigap_mobile/presentation/pages/auth/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(dataSource: AuthDataSourceImpl()));
  }
}
