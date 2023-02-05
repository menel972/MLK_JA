import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Specific [TextStyle]
///
/// Common style values for text in the app.
abstract class TextBase extends TextStyle {
  final bool? bold;

  const TextBase({this.bold = false});

  @override
  TextDecoration? get decoration => TextDecoration.none;

  @override
  FontWeight? get fontWeight => bold! ? FontWeight.w700 : FontWeight.w400;
}

/// Headline style
class TextL extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Headline style
  ///
  /// Extends [TextStyle].
  /// fontSize => 22;
  const TextL({this.isBold = false, this.textColor = Colors.black})
      : super(bold: isBold);

  @override
  double? get fontSize => 22;
  @override
  double? get letterSpacing => 1;
  @override
  Color? get color => textColor;
  @override
  String? get fontFamily => GoogleFonts.oswald().fontFamily;
}

/// Subtitle style
class TextM extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Subtitle style
  ///
  /// Extends [TextStyle].
  /// fontSize => 18;
  const TextM({this.isBold = false, this.textColor = Colors.black})
      : super(bold: isBold);

  @override
  double? get fontSize => 18;
  @override
  double? get letterSpacing => 0.8;
  @override
  Color? get color => textColor;
  @override
  String? get fontFamily => GoogleFonts.oswald().fontFamily;
}

/// Basic text style
class TextS extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Basic text style
  ///
  /// Extends [TextStyle].
  /// fontSize => 14;
  const TextS({this.isBold = false, this.textColor = Colors.black})
      : super(bold: isBold);

  @override
  double? get fontSize => 14;
  @override
  double? get letterSpacing => 0.6;
  @override
  Color? get color => textColor;
  @override
  String? get fontFamily => GoogleFonts.openSans().fontFamily;
}

class TextXS extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Basic text style
  ///
  /// Extends [TextStyle].
  /// fontSize => 12;
  const TextXS({this.isBold = false, this.textColor = Colors.black})
      : super(bold: isBold);

  @override
  double? get fontSize => 12;
  @override
  double? get letterSpacing => 0.5;
  @override
  Color? get color => textColor;
  @override
  String? get fontFamily => GoogleFonts.openSans().fontFamily;
}
