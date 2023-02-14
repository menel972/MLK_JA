import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlk_ja/after/presentation/after_screen.dart';
import 'package:mlk_ja/common/loaders/connectivity_loader.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';
import 'package:mlk_ja/home/presentation/home_screen.dart';

/// ScreenPaths class provides all paths used for routing
class ScreenPaths {
  static const String home = '/';
  static const String after = '/after';
  static const String connectivityError = '/connectivity';
}

/// Routing configuration
///
/// router lists specifies the top-level routes for the app.
/// It allows navigation using [ScreenPaths].
GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: ScreenPaths.home,
      builder: (BuildContext context, GoRouterState state) => BlocProvider(
        create: (_) => HomeBloc(),
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '${ScreenPaths.after}/:uid',
      builder: (BuildContext context, GoRouterState state) =>
          AfterScreen(state.params['uid']!),
    ),
    GoRoute(
      path: ScreenPaths.connectivityError,
      builder: (BuildContext context, GoRouterState state) => BlocProvider(
        create: (_) => HomeBloc(),
        child: const ConnectivityLoader(),
      ),
    ),
  ],
);
