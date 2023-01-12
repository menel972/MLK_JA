import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlk_ja/after/presentation/after_screen.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';
import 'package:mlk_ja/home/presentation/home_screen.dart';

/// ScreenPaths class provides all paths used for routing
class ScreenPaths {
  static const String home = '/';
  static const String after = '/after';
}

/// Routing configuration
///
/// router lists specifies the top-level routes for the app.
/// It allows navigation using [ScreenPaths].
GoRouter router = GoRouter(routes: [
  GoRoute(
    path: ScreenPaths.home,
    builder: (context, state) => BlocProvider(
      create: (_) => HomeBloc(),
      child: const HomeScreen(),
    ),
  ),
  GoRoute(
    path: ScreenPaths.after,
    builder: (context, state) => const AfterScreen(),
  ),
]);
