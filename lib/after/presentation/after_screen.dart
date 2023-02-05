import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mlk_ja/after/presentation/models/ui_after.dart';
import 'package:mlk_ja/after/presentation/widgets/after_info.dart';
import 'package:mlk_ja/common/mocks/ui_after_mocks.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/size.dart';

class AfterScreen extends HookConsumerWidget {
  final String uid;

  const AfterScreen(this.uid, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UiAfter after = uiAfterMocked.firstWhere((event) => event.uid == uid);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              after.image ?? after.type.image,
              height: screen(context).height * 0.35,
              width: screen(context).width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: screen(context).height * 0.35,
              width: screen(context).width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // Colors.black54,
                    // Colors.black12,
                    Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: marginXS(context).height,
            left: marginXXS(context).height,
            child: GestureDetector(
              onTap: () => context.go(ScreenPaths.home),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 40,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                  color: Colors.white12,
                ),
                padding: EdgeInsets.all(marginXXS(context).width),
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AfterInfo(after),
          )
        ],
      ),
    );
  }
}
