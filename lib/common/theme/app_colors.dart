import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors extends ColorScheme {
  const AppColors({
    super.brightness = Brightness.light,
    super.primary = Colors.black,
    super.onPrimary = Colors.white,
    super.primaryContainer = CupertinoColors.systemGreen,
    super.secondary = Colors.black54,
    super.onSecondary = Colors.white54,
    super.error = CupertinoColors.systemRed,
    super.onError = Colors.black,
    super.background = Colors.white,
    super.onBackground = Colors.black,
    super.surface = Colors.white,
    super.onSurface = Colors.purple,
    super.outline = CupertinoColors.systemIndigo,
  });

  AppColors.dark({
    super.background = const Color(0xff0b0d0f),
    super.primary = Colors.white,
    super.onPrimary = Colors.black,
    super.secondary = Colors.white54,
    super.onSecondary = Colors.black54,
    super.tertiary = Colors.white38,
    super.onTertiary = Colors.black38,
    super.tertiaryContainer = Colors.white24,
    super.surface = Colors.white12,
    super.onSurface = Colors.white,
  }) : super.dark(
          error: CupertinoColors.systemRed.darkColor,
          primaryContainer: CupertinoColors.systemGreen.darkColor,
          outline: CupertinoColors.systemIndigo.darkColor,
        );
}
