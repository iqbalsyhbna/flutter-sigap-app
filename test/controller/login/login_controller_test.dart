import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:sigap_mobile/data/data_source/server/auth_datasource/auth_datasource.dart';
import 'package:sigap_mobile/data/model/base_response.dart';
import 'package:sigap_mobile/presentation/pages/auth/login/login_controller.dart';

// import 'package:get_test/get_test.dart';

import '../../fixture/fixture_reader.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks([AuthDataSource])
void main() {
  late MockAuthDataSource mockAuthDataSource;
  late ApiResponse successResult;
  late ApiResponse errorResult;
  late dynamic accountData;

  setUp(() {
    Get.testMode = true;
    mockAuthDataSource = MockAuthDataSource();
    accountData = jsonDecode(fixture("login.json"));
    successResult = ApiResponse(success: true, data: accountData);
    errorResult = ApiResponse(success: false, message: 'Some Error');
  });

  test('''Login Contoller test''', () {
    final controller = LoginController(dataSource: mockAuthDataSource);
    // expect(controller.usernameController, isA<TextEditingController>());
    // expect(controller.passController, isA<TextEditingController>());
    // expect(controller.isHiddenPassword.value, true);
    // expect(controller.isHiddenPassword, controller.isHiddenPassword.toggle());

    bool validForm = controller.validateField();
    controller.formKey.currentState!.validate();
    expect(validForm, true);
  });

  // testController<LoginController>(
  //   '''Login Controller test''',
  //       (controller) {
  //     // controller.login()
  //     //     test('asd', () async {
  //     //       expect(controller.passController, isA<TextEditingController>());
  //     //     });
  //       },
  //   controller: LoginController(dataSource: mockAuthDataSource),
  //   onClose: (c) => c.onClose(),
  //   onInit: (c) {},
  //   onReady: (c) {},
  // );
}
