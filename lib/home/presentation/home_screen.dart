import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';
import 'package:mlk_ja/home/presentation/widgets/account/account_view.dart';
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

    return BlocConsumer<HomeBloc, int>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: [
            const CarouselView(),
            const CalendarView(),
            const StaffView(),
            const FeedbackView(),
            const AccountView(),
          ][state],
          bottomNavigationBar: HomeBottomBar(
            index: state,
            function: context.read<HomeBloc>().changeView,
          ),
        );
      },
    );
  }
}
