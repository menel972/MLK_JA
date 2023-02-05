import 'package:flutter/material.dart';
import 'package:mlk_ja/common/theme/colours.dart';

class HomeBottomBar extends BottomNavigationBar {
  final int index;
  final Function(int) function;

  HomeBottomBar({
    super.key,
    required this.index,
    required this.function,
  }) : super(items: [
          BottomNavigationBarItem(
            icon: Icon(index == 0
                ? Icons.view_carousel
                : Icons.view_carousel_outlined),
            label: 'Carousel',
          ),
          BottomNavigationBarItem(
            icon: Icon(index == 1
                ? Icons.calendar_today
                : Icons.calendar_today_outlined),
            label: 'Calendrier',
          ),
          BottomNavigationBarItem(
            icon: Icon(index == 2 ? Icons.feedback : Icons.feedback_outlined),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(index == 3 ? Icons.person : Icons.person_outline),
            label: 'Staff',
          ),
        ]);

  @override
  int get currentIndex => index;

  @override
  ValueChanged<int>? get onTap => (int i) => function(i);

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  BottomNavigationBarType? get type => BottomNavigationBarType.fixed;

  @override
  double? get elevation => 0;

  @override
  Color? get unselectedItemColor => Colours.grey;

  @override
  Color? get selectedItemColor => Colors.black;

  @override
  bool? get showUnselectedLabels => false;

  @override
  bool? get showSelectedLabels => false;

  @override
  IconThemeData? get selectedIconTheme => const IconThemeData(size: 35);

  @override
  IconThemeData? get unselectedIconTheme => const IconThemeData(size: 23);
}
