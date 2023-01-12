import 'package:flutter/material.dart';
import 'package:mlk_ja/common/theme/colours.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class SuccessSnackBar extends SnackBar {
  final String message;
  const SuccessSnackBar(this.message, {super.key})
      : super(content: const Center());

  @override
  Widget get content => Text(message, style: const TextS(Colors.white));

  @override
  Color? get backgroundColor => Colours.success;

  @override
  Duration get duration => const Duration(seconds: 3);
}

class ErrorSnackBar extends SnackBar {
  final String message;
  const ErrorSnackBar(this.message, {super.key})
      : super(content: const Center());

  @override
  Widget get content => Text(message, style: const TextS(Colors.white));

  @override
  Color? get backgroundColor => Colours.error;

  @override
  Duration get duration => const Duration(seconds: 3);
}
