import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';
import 'package:sigap_mobile/presentation/pages/home/home_controller.dart';
import 'package:sigap_mobile/presentation/widgets/custom_button_widget.dart';
import 'package:sigap_mobile/presentation/widgets/general_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(title: "Home Page", onPress: () => Get.back()),
      ),
      body: SafeArea(
        child: Content(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => Text(("Nama : ${controller.name.value}"),
                  style: baseFontStyleBig)),
              Obx(() => Text(("Email : ${controller.email.value}"),
                  style: baseFontStyleBig)),
              const SizedBox(height: 20),
              CustomButton(
                  text: "Get Account from DB",
                  color: primaryColor,
                  onPress: () => controller.getAccountFromDB()),
              CustomButton(
                  text: "Logout",
                  color: primaryColor,
                  onPress: () => controller.logout())
            ],
          ),
        ),
      ),
    );
  }
}
