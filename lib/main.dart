import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sigap_mobile/presentation/routes/app_routename.dart';
import 'package:sigap_mobile/presentation/routes/app_routes.dart';
import 'package:sigap_mobile/core/theme/app_theme.dart';
import 'package:sigap_mobile/core/app/app_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AppServices.initServices();
  SystemChrome.setSystemUIOverlayStyle(setStatusBarColor());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SIGAP Mobile",
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: appPages(),
      initialRoute: RouteName.SIGN_IN,
    );
  }
}
