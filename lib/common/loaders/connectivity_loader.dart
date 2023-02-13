import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/strings.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/bloc/home_bloc.dart';

class ConnectivityLoader extends StatelessWidget {
  const ConnectivityLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, ConnectivitySate>(
      listener: (BuildContext context, ConnectivitySate state) {
        if (state.connection != ConnectivityResult.none) {
          context.go(ScreenPaths.home);
        }
      },
      builder: (BuildContext context, ConnectivitySate state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MediaQuery.platformBrightnessOf(context) == Brightness.light
                    ? '${Strings.logoImagesPath}/logo_noir.PNG'
                    : '${Strings.logoImagesPath}/logo_blanc.png',
                height: Dimensions.l(context).height,
              ),
              AutoSizeText(
                'Cette application a besoin d\'internet pour fonctonner.',
                style: Font.m(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.xxs(context).height),
              AutoSizeText(
                'Vérifie ta connexion.',
                style: Font.l(color: Theme.of(context).colorScheme.primary),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
