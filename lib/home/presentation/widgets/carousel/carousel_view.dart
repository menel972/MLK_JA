// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:mlk_ja/common/mocks/carousel_items_mock.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
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
        .initEvents(carouselItemsMocked);

    final items = Provider.of<EventProvider>(context).filteredEvents;

    return FlutterCarousel.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) => GestureDetector(
        onTap: () => context.go(ScreenPaths.after),
        child: Image.asset(items[index].image ?? items[index].type.image,
            fit: BoxFit.fill),
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
