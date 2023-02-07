import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarTheme extends BottomNavigationBarThemeData {
  @override
  BottomNavigationBarType? get type => BottomNavigationBarType.fixed;

  @override
  double? get elevation => 0;

  @override
  bool? get showUnselectedLabels => false;

  @override
  bool? get showSelectedLabels => false;

  @override
  IconThemeData? get selectedIconTheme => const IconThemeData(size: 35);

  @override
  IconThemeData? get unselectedIconTheme => const IconThemeData(size: 23);

  const BottomBarTheme({
    super.backgroundColor = Colors.transparent,
    super.selectedItemColor = Colors.black,
    super.unselectedItemColor = Colors.black54,
  });

  BottomBarTheme.dark({
    super.selectedItemColor = Colors.white,
    super.unselectedItemColor = Colors.white54,
  }) : super(backgroundColor: CupertinoColors.systemGrey5.darkColor);
}
