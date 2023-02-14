import 'package:flutter/material.dart';

class HomeBottomBar extends BottomNavigationBar {
  final int index;
  final Function(int) function;

  HomeBottomBar({
    required this.index,
    required this.function,
    super.key,
  }) : super(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                index == 0 ? Icons.view_carousel : Icons.view_carousel_outlined,
              ),
              label: 'Carousel',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                index == 1
                    ? Icons.calendar_today
                    : Icons.calendar_today_outlined,
              ),
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
          ],
        );

  @override
  int get currentIndex => index;

  @override
  ValueChanged<int>? get onTap => (int i) => function(i);
}
