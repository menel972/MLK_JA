import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mlk_ja/common/theme/icons.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';

class AfterInfoTile extends ListTile {
  final BuildContext context;
  final bool isDate;
  final String? label;
  final String info;
  final Event? event;
  final Coords? coords;

  const AfterInfoTile(
    this.context, {
    super.key,
    required this.isDate,
    required this.info,
    this.label,
    this.event,
    this.coords,
  });

  @override
  Widget? get title => Text(
        label ?? '',
        style: Font.xs(color: Theme.of(context).colorScheme.secondary),
      );

  @override
  Widget? get subtitle => Text(
        info,
        style: Font.s(color: Theme.of(context).colorScheme.primary, bold: true),
      );

  @override
  Widget? get leading => AfterInfoIcon(
        context,
        icon: isDate ? Icons.access_time : Icons.location_on_outlined,
      );

  @override
  Widget? get trailing => AfterInfoIcon(
        context,
        isRounded: true,
        icon: isDate ? Icons.calendar_today : Icons.near_me_outlined,
      );

  @override
  EdgeInsetsGeometry? get contentPadding => const EdgeInsets.all(0);

  @override
  bool? get dense => true;

  @override
  GestureTapCallback? get onTap => () async {
        final List<AvailableMap> availableMaps =
            await MapLauncher.installedMaps;

        isDate
            ? Add2Calendar.addEvent2Cal(event!)
            : await availableMaps.first.showMarker(
                coords: coords!,
                title: info,
              );
      };
}
