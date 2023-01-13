// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:intl/date_symbol_data_local.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/theme/theme.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:provider/src/change_notifier_provider.dart'
    show ChangeNotifierProvider;
import 'package:provider/src/provider.dart' show MultiProvider;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Preserves the splash on screen until the method [FlutterNativeSplash.remove()] is invoked
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  initializeDateFormatting()
      .then((_) => runApp(const riverpod.ProviderScope(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: EventProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        theme: theme,
      ),
    );
  }
}
