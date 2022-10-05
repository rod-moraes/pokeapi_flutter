import 'package:flutter/material.dart';

class ResponsividadeUtils {
  static double get sizeMobile => 620;
  static double get sizeTable => 1080.0;
  static double get desiredWidth => 1080.0;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeTable;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < sizeMobile;
}
