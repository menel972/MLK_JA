//Enum example

// enum TileDimension {
//   s('small'),
//   m('medium'),
//   l('large');
//
//   const TileDimension(this.value);
//   final String value;
// }

// enum LoginState { loading, unauthenticated, authenticated }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AfterType {
  worship(
    'Worship Connect',
    'assets/images/afters/Visuel After_Worship Connect.jpg',
    Color(0xff6767b1),
  ),
  talk(
    'Real Talk',
    'assets/images/afters/Visuel After_Real Talk.png',
    Color(0xff75fabc),
  ),
  chill(
    'Jeu',
    'assets/images/afters/Visuel After_Chill Connect.JPEG',
    Color(0xffc8c8c8),
  ),
  open(
    'Open Mic',
    'assets/images/afters/Visuel After_OPEN MIC.png',
    Color(0xfff9dedc),
  ),
  special('Special Event', '', CupertinoColors.systemTeal),
  mlk('Évènement MLK', '', Colors.brown);

  final String value;
  final String image;
  final Color color;
  const AfterType(this.value, this.image, this.color);
}
