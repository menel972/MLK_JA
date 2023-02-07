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
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';
import 'package:provider/provider.dart';

class CarouselView extends riverpod.ConsumerStatefulWidget {
  const CarouselView({super.key});

  @override
  riverpod.ConsumerState<CarouselView> createState() => _CarouselViewState();
}

class _CarouselViewState extends riverpod.ConsumerState<CarouselView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      controller.nextPage(duration: const Duration(milliseconds: 600));
    });

    super.initState();
  }

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Provider.of<EventProvider>(context, listen: false)
        .initEvents(uiAftersPreviewMocked);

    final List<UiAfterPreview> items =
        Provider.of<EventProvider>(context).currentMonthEvents;

    return FlutterCarousel.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index, int realIndex) =>
          GestureDetector(
        onTap: () => context.go('${ScreenPaths.after}/${items[index].uid}'),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              items[index].image ?? items[index].type.image,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              alignment: Alignment.center,
              height: Dimensions.s(context).height,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: Dimensions.xxs(context).height),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.background.withOpacity(0.4),
                    Theme.of(context).colorScheme.background.withOpacity(0.6),
                    Theme.of(context).colorScheme.background.withOpacity(0.7),
                    Theme.of(context).colorScheme.background.withOpacity(0.6),
                    Theme.of(context).colorScheme.background.withOpacity(0.4),
                    Colors.transparent
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'PRENDS TA PLACE :',
                    style: Font.m(
                      color: Theme.of(context).colorScheme.secondary,
                      bold: true,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    '${items[index].type.value} - ${DateFormat('MMMM', 'fr_FR').format(DateTime.now())}'
                        .toUpperCase(),
                    style: Font.l(
                      color: Theme.of(context).colorScheme.secondary,
                      bold: true,
                    ),
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
  double? get height => Dimensions.screen(context).height;

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
