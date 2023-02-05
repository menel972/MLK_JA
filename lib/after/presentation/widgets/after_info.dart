import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/after/presentation/models/ui_after.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/common/theme/colours.dart';
import 'package:mlk_ja/common/theme/icons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/common/theme/tiles.dart';
import 'package:mlk_ja/common/web_view.dart';

class AfterInfo extends StatelessWidget {
  final UiAfter after;
  const AfterInfo(this.after, {super.key});

  String durationFormat(Duration d) {
    List<String> a = d.toString().split('.');
    a.removeLast();
    List<String> b = a.first.split(':');
    b.removeLast();

    return b.join(' h ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: marginXS(context).width),
      height: screen(context).height * 0.7,
      width: screen(context).width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ListView.separated(
        itemCount: 9 + after.guests.length,
        separatorBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(height: marginXS(context).width);
          }
          if (index == 6 + after.guests.length) {
            return SizedBox(height: marginXS(context).width);
          }
          if (index == 5 + after.guests.length) {
            return SizedBox(height: marginXS(context).width);
          }
          if (index == 3 + after.guests.length) {
            return SizedBox(height: marginXS(context).width);
          }
          return SizedBox(height: marginXXS(context).width);
        },
        itemBuilder: (context, index) => [
          AutoSizeText(
            after.name == null
                ? after.type.value
                : '${after.type.value} - ${after.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextL(isBold: true),
          ),
          const AutoSizeText(
            'Par :',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextS(textColor: Colours.grey),
          ),
          ...after.guests.map((guest) => GestureDetector(
                onTap: () => guest.url != null
                    ? WebView(guest.url!).showInternet()
                    : null,
                child: Row(
                  children: [
                    Text(
                      '${guest.name} • ',
                      style: const TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.6,
                        color: Colours.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Text(
                      guest.url != null ? ' Suivre' : '',
                      style: const TextS(
                        textColor: Colors.indigo,
                        isBold: true,
                      ),
                    ),
                  ],
                ),
              )),
          AfterInfoButton(context, url: after.url),
          const Text(
            'Où et quand',
            style: TextM(isBold: true),
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
          const Text(
            'À propos de cet évènement',
            style: TextM(isBold: true),
          ),
          ListTile(
            leading:
                AfterInfoIcon(context, icon: Icons.history_toggle_off_outlined),
            title: Text(
              durationFormat(after.duration),
              style: const TextS(isBold: true),
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
          Text(
            after.description ?? '',
            textAlign: TextAlign.justify,
            style: const TextS(),
          ),
        ][index],
      ),
    );
  }
}
