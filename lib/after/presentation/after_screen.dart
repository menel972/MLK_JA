import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mlk_ja/after/presentation/models/ui_after.dart';
import 'package:mlk_ja/after/presentation/widgets/after_info.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/mocks/ui_after_mocks.dart';
import 'package:mlk_ja/common/router.dart';

class AfterScreen extends HookConsumerWidget {
  final String uid;

  const AfterScreen(this.uid, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UiAfter after =
        uiAfterMocked.firstWhere((UiAfter event) => event.uid == uid);

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        context.go(ScreenPaths.home);
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                after.image ?? after.type.image,
                height: Dimensions.screen(context).height * 0.35,
                width: Dimensions.screen(context).width,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                height: Dimensions.screen(context).height * 0.35,
                width: Dimensions.screen(context).width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black54,
                      Colors.black12,
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            Positioned(
              top: Dimensions.xs(context).height,
              child: GestureDetector(
                onTap: () => context.go(ScreenPaths.home),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
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
                  padding: EdgeInsets.all(Dimensions.xxs(context).width),
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: AfterInfo(after),
              ),
            )
          ],
        ),
      ),
    );
  }
}
