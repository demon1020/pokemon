import 'package:flutter/material.dart';
import '../theme/material_color.dart';


class AppColor {
  static const Color primaryLight0 = Color(0xFFF00000);
  static const Color primaryDark0 = Color(0xFF222224);

  static MaterialColor primary = CustomMaterialColor.generate(0xFFEE1515);
  static MaterialColor primaryDark = CustomMaterialColor.generate(0xFF222224);

  static const Color primaryLight = Color(0xFFE5F8FB);
  static const Color lightGrey = Color(0xFFA2A7AD);
  static const Color darkGrey = Color(0xFF232C36);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color error = Colors.redAccent;
  static const Color warning = Colors.orangeAccent;

}