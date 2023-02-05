// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';

import 'package:mlk_ja/common/size.dart';
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
          vertical: marginXS(context).width,
          horizontal: marginXXS(context).width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_noir.PNG',
              height: marginL(context).width,
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: marginXS(context).width);
                  },
                  itemBuilder: (context, index) => [
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: Colors.black12),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(marginXXS(context).height),
                        child: Column(
                          children: [
                            const Text(
                              'FAIS PARTI DU CHANGEMENT : ',
                              style: TextM(isBold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: marginXXS(context).height),
                            Visibility(
                              visible: lastEvent.type != AfterType.mlk,
                              child: FeedbackButton(
                                  label: 'ON PEUT FAIRE MIEUX ?',
                                  date:
                                      '${lastEvent.name?.toUpperCase() ?? lastEvent.type.value.toUpperCase()} - ${DateFormat('dd/MM/y').format(lastEvent.date)}',
                                  url: Strings.afterFormUrl),
                            ),
                            SizedBox(height: marginXXS(context).width),
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
                        side: const BorderSide(color: Colors.black12),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(marginXXS(context).height),
                        child: Column(
                          children: [
                            const Text(
                              'RESTE CONNECTÉ :',
                              style: TextM(isBold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: marginXXS(context).height),
                            FeedbackButton(
                              label: 'SUIS NOUS SUR INSTAGRAM',
                              url: Strings.instagramUrl,
                            ),
                            SizedBox(height: marginXXS(context).width),
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
                        side: const BorderSide(color: Colors.black12),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(marginXXS(context).height),
                        child: Column(
                          children: [
                            const Text(
                              'MLK A BESOIN DE TOI :',
                              style: TextM(isBold: true),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: marginXXS(context).height),
                            FeedbackButton(
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
