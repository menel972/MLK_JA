// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';

import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/strings.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';
import 'package:provider/provider.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    UiAfterPreview lastEvent = Provider.of<EventProvider>(context).lastEvent;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.xs(context).width,
          horizontal: Dimensions.xxs(context).width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              MediaQuery.platformBrightnessOf(context) == Brightness.light
                  ? '${Strings.logoImagesPath}/logo_noir.PNG'
                  : '${Strings.logoImagesPath}/logo_blanc.png',
              height: Dimensions.l(context).width,
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: Dimensions.xs(context).width);
                  },
                  itemBuilder: (context, index) => [
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.xxs(context).height),
                        child: Column(
                          children: [
                            Text(
                              'FAIS PARTI DU CHANGEMENT :',
                              style: Font.m(
                                  color: Theme.of(context).colorScheme.primary,
                                  bold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.xxs(context).height),
                            Visibility(
                              visible: lastEvent.type != AfterType.mlk,
                              child: FeedbackButton(
                                  label: 'ON PEUT FAIRE MIEUX ?',
                                  date:
                                      '${lastEvent.name?.toUpperCase() ?? lastEvent.type.value.toUpperCase()} - ${DateFormat('dd/MM/y').format(lastEvent.date)}',
                                  url: Strings.afterFormUrl),
                            ),
                            SizedBox(height: Dimensions.xxs(context).width),
                            const FeedbackButton(
                                label: 'POSE TES QUESTIONS ICI', url: ''),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.xxs(context).height),
                        child: Column(
                          children: [
                            Text(
                              'RESTE CONNECTÉ :',
                              style: Font.m(
                                  color: Theme.of(context).colorScheme.primary,
                                  bold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.xxs(context).height),
                            const FeedbackButton(
                              label: 'SUIS NOUS SUR INSTAGRAM',
                              url: Strings.instagramUrl,
                            ),
                            SizedBox(height: Dimensions.xxs(context).width),
                            const FeedbackButton(
                              label: 'SUIS NOUS SUR WHATSAPP',
                              url: '',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.xxs(context).height),
                        child: Column(
                          children: [
                            Text(
                              'MLK A BESOIN DE TOI :',
                              style: Font.m(
                                  color: Theme.of(context).colorScheme.primary,
                                  bold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Dimensions.xxs(context).height),
                            const FeedbackButton(
                              label: 'IMPLIQUE TOI DANS UN SERVICE',
                              url: Strings.mlkWebsiteUrl,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ][index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
