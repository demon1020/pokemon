
import 'package:flutter/material.dart';
import '../res/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static ThemeData get lightTheme => _lightThemeData;
  static ThemeData get darkTheme => _darkThemeData;

  static final _lightThemeData = _getThemeData(AppColor.primary);
  static final _darkThemeData = _getThemeData(AppColor.primaryDark);

  static ThemeData _getThemeData(MaterialColor color) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: color,
      fontFamily: GoogleFonts.poppins().fontFamily,//'Pokemon-solid',
      appBarTheme: const AppBarTheme(
        elevation: 1,
      ),
    );
  }
}
