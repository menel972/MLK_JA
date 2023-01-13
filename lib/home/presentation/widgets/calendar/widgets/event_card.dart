import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/router.dart';
import 'package:mlk_ja/common/theme/buttons.dart';
import 'package:mlk_ja/home/presentation/models/ui_event.dart';

class EventCard extends ListTile {
  final BuildContext context;
  final UiEvent event;

  const EventCard(this.context, {super.key, required this.event});

  @override
  GestureTapCallback? get onTap => () => context.go(ScreenPaths.after);

  @override
  Widget? get title => Text(event.name ?? event.type.value);

  @override
  Widget? get subtitle => Text(DateFormat('dd / MM / y').format(event.date));

  @override
  Color? get tileColor => event.type.color.withOpacity(0.2);

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: event.type.color.withOpacity(0.7)),
      );

  @override
  Widget? get trailing => SubscriptionButton(
        context,
        label: 'S\'inscrire',
        url: event.url,
      );
}
