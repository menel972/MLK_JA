import 'package:flutter/material.dart';

class HomeBottomBar extends BottomNavigationBar {
  final int index;
  final Function(int) function;

  HomeBottomBar({
    super.key,
    required this.index,
    required this.function,
  }) : super(items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendrier',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Staff',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mon Compte',
          ),
        ]);

  @override
  int get currentIndex => index;

  @override
  ValueChanged<int>? get onTap => (int i) => function(i);

  @override
  Color? get backgroundColor => Colors.transparent;

  @override
  double? get elevation => 0;

  @override
  Color? get unselectedItemColor => Colors.black;

  @override
  Color? get selectedItemColor => Colors.black;
}
