import 'package:flutter/material.dart';

class DimensionHelper {
  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static bool isWeb(BuildContext context) =>
      getWidth(context) <= 800 ? false : true;

  static ScreenSize getScreenSize(BuildContext context) =>
      getWidth(context) <= 600
          ? ScreenSize.small
          : getWidth(context) <= 1200
              ? ScreenSize.medium
              : ScreenSize.large;
}

enum ScreenSize {
  small,
  medium,
  large,
}
