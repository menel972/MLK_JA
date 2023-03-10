import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/after/presentation/models/ui_after.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/common/theme/icons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/common/theme/tiles.dart';
import 'package:mlk_ja/common/web_view.dart';

class AfterInfo extends StatelessWidget {
  final UiAfter after;
  const AfterInfo(this.after, {super.key});

  String durationFormat(Duration d) {
    List<String> a = [];
    List<String> b = [];

    a
      ..addAll(d.toString().split('.'))
      ..removeLast();

    b
      ..addAll(a.first.split(':'))
      ..removeLast();

    return b.join(' h ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.xs(context).width),
      height: Dimensions.screen(context).height * 0.7,
      width: Dimensions.screen(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ListView.separated(
        itemCount: 9 + after.guests.length,
        separatorBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(height: Dimensions.xs(context).width);
          }
          if (index == 6 + after.guests.length) {
            return SizedBox(height: Dimensions.xs(context).width);
          }
          if (index == 5 + after.guests.length) {
            return SizedBox(height: Dimensions.xs(context).width);
          }
          if (index == 3 + after.guests.length) {
            return SizedBox(height: Dimensions.xs(context).width);
          }
          return SizedBox(height: Dimensions.xxs(context).width);
        },
        itemBuilder: (BuildContext context, int index) => [
          AutoSizeText(
            after.name == null
                ? after.type.value
                : '${after.type.value} - ${after.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Font.l(
              color: Theme.of(context).colorScheme.primary,
              bold: true,
            ),
          ),
          AutoSizeText(
            'Par :',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Font.s(color: Theme.of(context).colorScheme.secondary),
          ),
          ...after.guests.map(
            (UiGuest guest) => GestureDetector(
              onTap: () =>
                  guest.url != null ? WebView(guest.url!).showInternet() : null,
              child: Row(
                children: [
                  Text(
                    '${guest.name} ??? ',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.6,
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    guest.url != null ? ' Suivre' : '',
                    style: Font.s(
                      color: Theme.of(context).colorScheme.outline,
                      bold: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AfterInfoButton(context, url: after.url),
          Text(
            'O?? et quand',
            style: Font.m(
              color: Theme.of(context).colorScheme.primary,
              bold: true,
            ),
          ),
          AfterInfoTile(
            context,
            isDate: true,
            label: DateFormat('d MMMM y', 'fr_FR').format(after.date),
            info:
                '${DateFormat('HH:m').format(after.date)} - ${DateFormat('HH:m').format(after.date.add(after.duration))}',
            event: after.toEvent(),
          ),
          AfterInfoTile(
            context,
            isDate: false,
            label: after.city,
            info: after.location,
            coords: after.coords,
          ),
          Text(
            '?? propos de cet ??v??nement',
            style: Font.m(
              color: Theme.of(context).colorScheme.primary,
              bold: true,
            ),
          ),
          ListTile(
            leading:
                AfterInfoIcon(context, icon: Icons.history_toggle_off_outlined),
            title: Text(
              durationFormat(after.duration),
              style: Font.s(
                color: Theme.of(context).colorScheme.primary,
                bold: true,
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
          Text(
            after.description ?? '',
            textAlign: TextAlign.justify,
            style: Font.s(color: Theme.of(context).colorScheme.primary),
          ),
        ][index],
      ),
    );
  }
}
