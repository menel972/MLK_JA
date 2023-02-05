import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';

class ConnectivityLoader extends StatelessWidget {
  const ConnectivityLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, ConnectivitySate>(listener: (context, state) {
      print(state.connection);
      if (state.connection != ConnectivityResult.none) {
        context.go(ScreenPaths.home);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_noir.PNG',
              height: marginL(context).height,
            ),
            const AutoSizeText(
              'Cette application a besoin d\'internet pour fonctonner.',
              style: TextM(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: marginXXS(context).height),
            const AutoSizeText(
              'Vérifie ta connexion.',
              style: TextL(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
