import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Provides all colors of the app
class Colours {
  static const Color grey = Color.fromRGBO(142, 142, 147, 1);

  static const Color background = Color.fromRGBO(250, 250, 250, 1);

  static const Color white = Color.fromRGBO(250, 250, 250, 0.8);

  /// Success
  static const Color success = Colors.green;

  /// Error
  static const Color error = Colors.red;
}

class AppColors extends ColorScheme {
  const AppColors({
    super.brightness = Brightness.light,
    super.primary = Colors.black,
    super.onPrimary = Colors.white,
    super.secondary = Colors.black54,
    super.onSecondary = Colors.white54,
    super.error = CupertinoColors.systemRed,
    super.onError = Colors.black,
    super.background = Colors.white,
    super.onBackground = Colors.black,
    super.surface = Colors.red,
    super.onSurface = Colors.purple,
  });

  AppColors.dark({
    super.background = const Color(0x000b0d0f),
    super.primary = Colors.white,
    super.onPrimary = Colors.black,
    super.secondary = Colors.white54,
    super.onSecondary = Colors.black54,
    super.tertiary = Colors.white38,
    super.onTertiary = Colors.black38,
    super.tertiaryContainer = Colors.white24,
    super.surface = Colors.white12,
    super.onSurface = Colors.white,
  }) : super.dark(error: CupertinoColors.systemRed.darkColor);
}
