// ignore_for_file: depend_on_referenced_packages

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:mlk_ja/common/dimensions.dart';
import 'package:mlk_ja/common/theme/text_theme.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/bloc/calendar_bloc.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/widgets/event_card.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/widgets/event_filter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class CalendarView extends riverpod.HookConsumerWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context, riverpod.WidgetRef ref) {
    List<UiAfterPreview> events = Provider.of<EventProvider>(context).events;

    List<UiAfterPreview> getEvent(DateTime day, AfterType? filter) => events
        .where(
          (UiAfterPreview event) =>
              event.date.subtract(
                    Duration(
                      hours: event.date.hour,
                      minutes: event.date.minute,
                    ),
                  ) ==
                  day &&
              event.type == (filter ?? event.type),
        )
        .toList();

    return BlocConsumer<CalendarBloc, CalendarState>(
      listener: (BuildContext context, CalendarState state) {},
      builder: (BuildContext context, CalendarState state) => Padding(
        padding: EdgeInsets.only(
          top: Dimensions.xs(context).height,
          left: Dimensions.xxs(context).height,
          right: Dimensions.xxs(context).height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                TableCalendar(
                  locale: 'fr_FR',
                  firstDay: DateTime.utc(2021, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: state.date,
                  onDaySelected: (DateTime selectedDay, DateTime focusedDay) =>
                      context.read<CalendarBloc>().onDateSelected(selectedDay),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (DateTime day) =>
                      isSameDay(state.date, day),
                  weekendDays: const [
                    DateTime.monday,
                    DateTime.tuesday,
                    DateTime.wednesday,
                    DateTime.thursday,
                    DateTime.friday,
                  ],
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    todayDecoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    markerDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle:
                        Font.s(color: Theme.of(context).colorScheme.tertiary),
                    todayTextStyle:
                        Font.s(color: Theme.of(context).colorScheme.tertiary),
                    defaultTextStyle:
                        Font.s(color: Theme.of(context).colorScheme.primary),
                  ),
                  eventLoader: (DateTime day) => getEvent(day, state.type),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (BuildContext context, DateTime day) {
                      return Text(
                        DateFormat('MMMM y', 'fr_FR').format(day).toTitleCase(),
                        textAlign: TextAlign.center,
                        style: Font.l(
                          color: Theme.of(context).colorScheme.primary,
                          bold: true,
                        ),
                      );
                    },
                    dowBuilder: (BuildContext context, DateTime day) {
                      return Text(
                        DateFormat('E', 'fr_FR').format(day).toTitleCase(),
                        textAlign: TextAlign.center,
                        style: Font.s(
                          color: Theme.of(context).colorScheme.secondary,
                          bold: true,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  'Flitrer :',
                  style: Font.s(color: Theme.of(context).colorScheme.secondary),
                ),
                SizedBox(
                  height: Dimensions.screen(context).width * 0.15,
                  child: EventFilter(
                    context.read<CalendarBloc>().onFilterSelected,
                    state.type,
                  ),
                ),
                Divider(
                  color: Theme.of(context).colorScheme.primary,
                  height: 5,
                ),
              ] +
              (getEvent(state.date, state.type).isNotEmpty
                  ? getEvent(state.date, state.type)
                      .map(
                        (UiAfterPreview event) => Padding(
                          padding:
                              EdgeInsets.all(Dimensions.xxs(context).width),
                          child: EventCard(context, event: event),
                        ),
                      )
                      .toList()
                  : [
                      Padding(
                        padding: EdgeInsets.all(Dimensions.xxs(context).height),
                        child: const Text('Aucun évènement'),
                      )
                    ]),
        ),
      ),
    );
  }
}
