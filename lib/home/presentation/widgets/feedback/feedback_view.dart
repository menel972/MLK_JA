// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';

import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/strings.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_event.dart';
import 'package:provider/provider.dart';

class FeedbackView extends StatelessWidget {
  const FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    UiEvent lastEvent = Provider.of<EventProvider>(context).lastEvent;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: marginXXS(context).width,
        ),
        child: ListView.separated(
          itemCount: 6,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            if (index >= 1 && index <= 3) {
              return SizedBox(height: marginXS(context).height);
            }
            return SizedBox(height: marginXS(context).width);
          },
          itemBuilder: (context, index) => [
            Image.asset(
              'assets/images/logo_noir.PNG',
              height: marginM(context).height,
            ),
            const Text(
              'On veut rester en contact avec toi !',
              style: TextM(Colors.black, isBold: true),
              textAlign: TextAlign.center,
            ),
            FeedbackButton(
                label:
                    'Laisse ton avis : ${lastEvent.name?.toUpperCase() ?? lastEvent.type.value.toUpperCase()}',
                date: DateFormat('dd / MM / y').format(lastEvent.date),
                url: Strings.afterFormUrl),
            const FeedbackButton(label: 'Pose tes questions', url: ''),
            FeedbackButton(label: 'Instagram', url: Strings.instagramUrl),
            FeedbackButton(
                label: 'Viens servir avec nous !', url: Strings.mlkWebsiteUrl),
          ][index],
        ),
      ),
    );
  }
}
