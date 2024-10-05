import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigap_mobile/core/theme/app_style.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  primarySwatch: materialPrimaryColor,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      statusBarColor: primaryColor,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  primarySwatch: materialPrimaryColor,
  fontFamily: 'Poppins',
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      statusBarColor: primaryColor,
    ),
  ),
);


extension DarkMode on BuildContext {
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

setStatusBarColor(){
  return const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: primaryColor,
  );
}

setPotraitOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}