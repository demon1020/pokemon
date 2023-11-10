
import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyle{
  static TextStyle bodyTextStyle() {
    return const TextStyle(
      color: AppColor.white,
      fontWeight: FontWeight.w300,
      fontSize: 15,
    );
  }

  static TextStyle titleTextStyleMedium() {
    return const TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
  }

  static TextStyle titleTextStyleLarge() {
    return const TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w600,
      fontSize: 25,
    );
  }
}
