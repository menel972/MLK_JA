// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/mocks/ui_after_preview_mocks.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:provider/provider.dart';

class CarouselView extends riverpod.ConsumerStatefulWidget {
  const CarouselView({super.key});

  @override
  riverpod.ConsumerState<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends riverpod.ConsumerState<CarouselView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      controller.nextPage(duration: const Duration(milliseconds: 600));
    });

    super.initState();
  }

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Provider.of<EventProvider>(context, listen: false)
        .initEvents(uiAftersPreviewMocked);

    final items = Provider.of<EventProvider>(context).currentMonthEvents;

    return FlutterCarousel.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) => GestureDetector(
        onTap: () => context.go('${ScreenPaths.after}/${items[index].uid}'),
        child: Stack(
          children: [
            Image.asset(
              items[index].image ?? items[index].type.image,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: marginXS(context).height,
                horizontal: marginXXS(context).width,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black54,
                    Colors.black45,
                    Colors.black38,
                    Colors.black26,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    'PRENDS TA PLACE :',
                    style: TextM(
                        textColor: Theme.of(context).colorScheme.secondary,
                        isBold: true),
                    maxLines: 1,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    '${items[index].type.value} - ${DateFormat('MMMM', 'fr_FR').format(DateTime.now())}'
                        .toUpperCase(),
                    style: TextL(
                        textColor: Theme.of(context).colorScheme.secondary,
                        isBold: true),
                    maxLines: 1,
                    minFontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      options: Options(context, remote: controller),
    );
  }
}

/// Extends [CarouselOptions] to provides parameters for [FlutterCarousel]
class Options extends CarouselOptions {
  final BuildContext context;
  final CarouselController remote;

  Options(this.context, {required this.remote});

  @override
  double? get height => screen(context).height;

  @override
  bool get enableInfiniteScroll => true;

  @override
  bool get showIndicator => true;

  @override
  double get viewportFraction => 1;

  @override
  bool? get enlargeCenterPage => true;

  @override
  CarouselController? get controller => remote;
}
