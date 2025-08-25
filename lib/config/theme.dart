import 'package:terapis/global_resource.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: primary),
    appBarTheme: appBarTheme(),
    textTheme: GoogleFonts.rubikTextTheme(), // Ganti di sini
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: GoogleFonts.rubik(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: Colors.grey[300]!),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputFocusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: Colors.grey[500]!, width: 1.4),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(17),
    borderSide: BorderSide(color: Colors.red[800]!),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputFocusBorder,
    errorBorder: outlineInputErrorBorder,
    border: outlineInputBorder,
    hintStyle: TextStyle(color: Colors.grey),
  );
}

Color primary = HexColor('#C0CA33');
Color primary2 = HexColor('#38B349');
Color success = HexColor('#00b300');
Color danger = HexColor('#cc0000');
Color warning = HexColor('#FFCA00');
Color info = HexColor('#1992ff');

LinearGradient primaryGradient = const LinearGradient(
  colors: [
    Color(0xFF4CAF50), // hijau daun
    Color(0xFFC0CA33), // lime gelap
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
