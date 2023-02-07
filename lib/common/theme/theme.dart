import 'package:flutter/material.dart';
import 'package:mlk_ja/common/theme/bottom_bar_theme.dart';
import 'package:mlk_ja/common/theme/colours.dart';

/// Defines UI light theme of the app
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: const AppColors(),
  bottomNavigationBarTheme: const BottomBarTheme(),
);

/// Defines UI dark theme of the app
ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff0b0d0f),
  colorScheme: AppColors.dark(),
  bottomNavigationBarTheme: BottomBarTheme.dark(),
);
