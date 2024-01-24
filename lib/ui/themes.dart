import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightPrimaryColor = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const Color darkPrimaryColor = Color(0xFF121212);

class Themes{
  static final light = ThemeData(
    primaryColor: lightPrimaryColor,
    backgroundColor: white,
    brightness: Brightness.light
  );
  static final dark = ThemeData(
    primaryColor: darkPrimaryColor,
    backgroundColor: darkPrimaryColor,
    brightness: Brightness.dark
  );
}

TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 24,
      color: Get.isDarkMode? white : Colors.black,
      fontWeight: FontWeight.bold,
    )
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.isDarkMode? white:Colors.black,
    )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode? white:Colors.black,
  );
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ));
}

TextStyle get bodyStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ));
}

TextStyle get body2Style {
  return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Get.isDarkMode ? Colors.grey : Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ));
}
