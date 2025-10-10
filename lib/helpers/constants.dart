import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF39A74A);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF333333); 
const kBackgroundColor = Colors.white;

final headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: kTextColor,
  height: 1.5,
);

const kDefaultPadding = 20.0;
const kHalfPadding = 10.0;

final RegExp emailValidatorRegExp = RegExp(
  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
);

const String kEmailNullError = "Mohon masukkan email Anda";
const String kInvalidEmailError = "Email tidak valid";
const String kPassNullError = "Mohon masukkan kata sandi";
const String kShortPassError = "Kata sandi terlalu pendek (min. 6 karakter)";
const String kMatchPassError = "Konfirmasi kata sandi tidak cocok";

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: const BorderSide(color: kSecondaryColor), 
    gapPadding: 10,
  );
}