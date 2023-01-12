import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class AfterScreen extends HookConsumerWidget {
  const AfterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () => context.go(ScreenPaths.home),
            child: const Text(
              'After Screen',
              style: TextM(Colors.black),
            )),
      ),
    );
  }
}
