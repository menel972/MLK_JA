import 'package:flutter/material.dart';

/// Specific [TextStyle]
///
/// Common style values for text in the app.
abstract class TextBase extends TextStyle {
  final bool? bold;

  const TextBase({this.bold = false});

  @override
  TextDecoration? get decoration => TextDecoration.none;

  @override
  FontWeight? get fontWeight => bold! ? FontWeight.w600 : FontWeight.w400;
}

/// Headline style
class TextL extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Headline style
  ///
  /// Extends [TextStyle].
  /// fontSize => 22;
  const TextL(this.textColor, {this.isBold = false}) : super(bold: isBold);

  @override
  double? get fontSize => 22;
  @override
  double? get letterSpacing => 0.5;
  @override
  Color? get color => textColor;
}

/// Subtitle style
class TextM extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Subtitle style
  ///
  /// Extends [TextStyle].
  /// fontSize => 18;
  const TextM(this.textColor, {this.isBold = false}) : super(bold: isBold);

  @override
  double? get fontSize => 18;
  @override
  double? get letterSpacing => 0.5;
  @override
  Color? get color => textColor;
}

/// Basic text style
class TextS extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Basic text style
  ///
  /// Extends [TextStyle].
  /// fontSize => 14;
  const TextS(this.textColor, {this.isBold = false}) : super(bold: isBold);

  @override
  double? get fontSize => 14;
  @override
  double? get letterSpacing => 0.6;
  @override
  Color? get color => textColor;
}

class TextXS extends TextBase {
  final Color textColor;
  final bool? isBold;

  /// Basic text style
  ///
  /// Extends [TextStyle].
  /// fontSize => 12;
  const TextXS(this.textColor, {this.isBold = false}) : super(bold: isBold);

  @override
  double? get fontSize => 12;
  @override
  double? get letterSpacing => 0.5;
  @override
  Color? get color => textColor;
}
