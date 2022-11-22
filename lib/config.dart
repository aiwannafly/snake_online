import 'dart:math';

import 'package:flutter/cupertino.dart';

class Config {
  static const String fontFamily = "Roboto";
  static const double maxWidth = 1200.0;
  static const borderRadius = 6.0;
  static const borderRadiusLarge = 16.0;
  static const padding = 10.0;
  static const margin = 10.0;
  static const Duration shortAnimationTime = Duration(milliseconds: 150);
  static const Duration animationTime = Duration(milliseconds: 200);

  static double pageHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double pageWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
