import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:sigap_mobile/core/helper/validator_helper.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';
import 'package:sigap_mobile/presentation/pages/auth/signup/signup_controller.dart';
import 'package:sigap_mobile/presentation/routes/app_routename.dart';
import 'package:sigap_mobile/presentation/widgets/custom_button_widget.dart';
import 'package:sigap_mobile/presentation/widgets/custom_form_field_widget.dart';
import 'package:sigap_mobile/presentation/widgets/general_widget.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Content(
          child: KeyboardDismisser(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  buildHeader(),
                  const SizedBox(height: 70),
                  buildForm(context),
                  const SizedBox(height: 20),
                  buildButton(context),
                  const SizedBox(height: 20),
                  buildSignIn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Sign Up", style: titleFontStyle),
          const SizedBox(height: 2),
          Text("Register Your Account", style: subtitleFontStyle),
        ],
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Full Name",
            style: formTitleStyle,
          ),
          const SizedBox(height: 12),
          CustomFieldForm(
            hint: "Your Full Name",
            controller: controller.usernameController,
            icon: Icons.person,
            validator: (value) => FieldValidator.validate(value!),
          ),
          const SizedBox(height: 20),
          Text(
            "Username",
            style: formTitleStyle,
          ),
          const SizedBox(height: 12),
          CustomFieldForm(
            hint: "Your Username",
            controller: controller.usernameController,
            icon: Icons.person,
            validator: (value) => FieldValidator.validate(value!),
          ),
          const SizedBox(height: 20),
          Text(
            "Email Address",
            style: formTitleStyle,
          ),
          const SizedBox(height: 12),
          CustomFieldForm(
            hint: "Your Email Address",
            controller: controller.usernameController,
            icon: Icons.email,
            validator: (value) => FieldValidator.validate(value!),
          ),
          const SizedBox(height: 20),
          Text(
            "Password",
            style: formTitleStyle,
          ),
          const SizedBox(height: 12),
          Obx(
            () => CustomPasswordFieldForm(
              hint: "Password",
              controller: controller.passController,
              icon: Icons.lock,
              hiddenText: controller.isHiddenPassword.value,
              endIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () => controller.hidePassword()),
              validator: (value) =>
                  PasswordLoginFieldValidator.validate(value!),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return CustomButtonIcon(
        onPress: () {
          FocusScope.of(context).unfocus();
          controller.login();
        },
        text: "Sign Up",
        color: primaryColor);
  }

  Row buildSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account ? ", style: baseFontStyleSmall),
        InkWell(
            onTap: () {
              Get.offAndToNamed(RouteName.SIGN_IN);
            },
            child: Text("Sign In",
                style: baseFontStyleSmall.copyWith(
                    color: primaryColor, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
