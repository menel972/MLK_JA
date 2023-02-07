import 'package:flutter/material.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class SuccessSnackBar extends SnackBar {
  final BuildContext context;
  final String message;
  const SuccessSnackBar(this.context, this.message, {super.key})
      : super(content: const Center());

  @override
  Widget get content => Text(message, style: Font.s(color: Colors.white));

  @override
  Color? get backgroundColor => Theme.of(context).colorScheme.primaryContainer;

  @override
  Duration get duration => const Duration(seconds: 3);
}

class ErrorSnackBar extends SnackBar {
  final BuildContext context;
  final String message;
  const ErrorSnackBar(this.context, this.message, {super.key})
      : super(content: const Center());

  @override
  Widget get content => Text(message, style: Font.s(color: Colors.white));

  @override
  Color? get backgroundColor => Theme.of(context).colorScheme.error;

  @override
  Duration get duration => const Duration(seconds: 3);
}
