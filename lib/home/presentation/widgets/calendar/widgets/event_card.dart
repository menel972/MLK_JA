import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';

class EventCard extends ListTile {
  final BuildContext context;
  final UiAfterPreview event;

  const EventCard(this.context, {super.key, required this.event});

  @override
  GestureTapCallback? get onTap =>
      () => context.go('${ScreenPaths.after}/${event.uid}');

  @override
  Widget? get title => Text(
        event.name == null
            ? event.type.value
            : '${event.type.value} - ${event.name}',
        style: TextS(
            textColor: Theme.of(context).colorScheme.primary, isBold: true),
      );

  @override
  Widget? get subtitle => Text(
        DateFormat('dd/MM/y').format(event.date),
        style: TextS(textColor: Theme.of(context).colorScheme.secondary),
      );

  @override
  Color? get tileColor => event.type.color.withOpacity(0.6);

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: event.type.color.withOpacity(0.2)),
      );

  @override
  Widget? get trailing => SubscriptionButton(
        context,
        label: 'S\'inscrire',
        url: event.url,
      );
}
