import 'package:flutter/material.dart';

// -------<Color Style>-------
// General
const Color primaryColor = Color(0xffFFC700);
const Color disabledPrimaryColor = Color(0xffe85a69);
const Color secondaryColor = Color(0xffFFC700);
const Color accentColor = Color(0xffcba633);
const Color systemGreyColor = Color(0xffF1F1F1);
const Color systemBlackColor = Color(0xff141414);
const Color systemDarkGreyColor = Color(0xffB8B8B8);
const Color systemBgDarkColor = Color(0xff303030);
const Color systemBgLightColor = Color(0xffFAFAFA);
const Color subtitleTextColor = Color(0xff504F5E);

// Material Color
Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, 1.0),
  100: const Color.fromRGBO(255, 255, 255, 0.9294117647058824),
  200: const Color.fromRGBO(255, 255, 255, 1.0),
  300: const Color.fromRGBO(213, 209, 211, 1.0),
  400: const Color.fromRGBO(199, 198, 199, 1.0),
  500: const Color.fromRGBO(179, 175, 177, 1.0),
  600: const Color.fromRGBO(156, 155, 156, 1.0),
  700: const Color.fromRGBO(139, 136, 137, 1.0),
  800: const Color.fromRGBO(68, 68, 68, 1.0),
  900: const Color.fromRGBO(45, 45, 45, 1.0),
};
MaterialColor materialPrimaryColor = MaterialColor(0xffb62435, color);

// -------<Font Style>-------
TextStyle baseFontStyleVeryBig = const TextStyle(fontSize: 34);
TextStyle baseFontStyleBig = const TextStyle(fontSize: 24);
TextStyle baseFontStyle = const TextStyle(fontSize: 16);
TextStyle baseFontStyleSmall = const TextStyle(fontSize: 14);
TextStyle baseFontStyleVerySmall = const TextStyle(fontSize: 10);

// Font Weight
FontWeight semiBoldWeight = FontWeight.w600;
FontWeight mediumWeight = FontWeight.w500;
FontWeight regularWeight = FontWeight.w400;

TextStyle titleFontStyle =
    baseFontStyleBig.copyWith(fontWeight: semiBoldWeight);
TextStyle subtitleFontStyle = baseFontStyleSmall.copyWith(
    color: subtitleTextColor, fontWeight: regularWeight);
TextStyle formTitleStyle = baseFontStyle.copyWith(fontWeight: mediumWeight);

TextStyle baseLinkFontStyle = const TextStyle(fontSize: 18, color: Colors.blue);
