import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigap_mobile/core/database/get_storage.dart';
import 'package:sigap_mobile/core/helper/general_function.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource.dart';
import 'package:sigap_mobile/presentation/routes/app_routename.dart';

class SignupController extends GetxController {
  final AuthDataSource dataSource;
  SignupController({required this.dataSource});

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  RxBool isHiddenPassword = true.obs;
  hidePassword() => isHiddenPassword.toggle();

  bool validateField() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      return true;
    }
    return false;
  }

  login() async {
    if (validateField()) {
      Loading.show();
      await dataSource
          .login(
        username: usernameController.text,
        password: passController.text,
      )
          .then((response) {
        Loading.hide();
        if (response.success) {
          getxStorage.saveAccount(response.data!);
          Get.toNamed(RouteName.HOME);
        } else {
          AppDialog.show(
            typeDialog: TypeDialog.FAILED,
            message: response.message.toString(),
            onPress: () => AppDialog.close(),
          );
        }
      });
    }
  }
}
