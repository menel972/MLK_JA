import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/bloc/calendar_bloc.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/calendar_view.dart';
import 'package:mlk_ja/home/presentation/widgets/carousel/carousel_view.dart';
import 'package:mlk_ja/home/presentation/widgets/feedback/feedback_view.dart';
import 'package:mlk_ja/home/presentation/widgets/home_bottom_bar.dart';
import 'package:mlk_ja/home/presentation/widgets/staff/staff_view.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FlutterNativeSplash.remove();

    return BlocConsumer<HomeBloc, ConnectivitySate>(
      listener: (BuildContext context, ConnectivitySate state) {
        if (state.connection == ConnectivityResult.none) {
          context.go(ScreenPaths.connectivityError);
        }
      },
      builder: (BuildContext context, ConnectivitySate state) {
        return Scaffold(
          body: [
            const CarouselView(),
            BlocProvider(
              create: (_) => CalendarBloc(),
              child: const CalendarView(),
            ),
            const FeedbackView(),
            const StaffView(),
          ][state.index],
          bottomNavigationBar: HomeBottomBar(
            index: state.index,
            function: context.read<HomeBloc>().changeView,
          ),
        );
      },
    );
  }
}
