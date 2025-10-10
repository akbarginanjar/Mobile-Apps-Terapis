import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
    ),
    appBarTheme: appBarTheme(),
    textTheme: GoogleFonts.poppinsTextTheme(), 
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder defaultBorder = outlineInputBorder(); 
  
  //Border saat field aktif (focused)
  OutlineInputBorder outlineInputFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: kPrimaryColor, width: 1.4), 
    gapPadding: 10,
  );
  
  // Border saat ada error
  OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: const BorderSide(color: Colors.red, width: 1.4), 
    gapPadding: 10,
  );
  
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    enabledBorder: defaultBorder,
    focusedBorder: outlineInputFocusBorder,
    errorBorder: outlineInputErrorBorder,
    border: defaultBorder, 
    hintStyle: TextStyle(color: kSecondaryColor), 
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: kTextColor, 
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}