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

import 'package:flutter/material.dart';

enum AfterType {
  worship('Worship Connect', 'assets/images/Visuel After_Worship Connect.jpg',
      Colors.deepPurple),
  talk('Real Talk', 'assets/images/Visuel After_Real Talk.png', Colors.green),
  chill(
      'Jeu', 'assets/images/Visuel After_Chill Connect.JPEG', Colors.blueGrey),
  open('Open Mic', 'assets/images/Visuel After_OPEN MIC.png', Colors.red),
  special('Special Event', '', Colors.amber),
  mlk('Évènement MLK', '', Colors.black26);

  final String value;
  final String image;
  final Color color;
  const AfterType(this.value, this.image, this.color);
}
