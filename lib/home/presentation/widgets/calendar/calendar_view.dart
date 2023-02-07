// ignore_for_file: depend_on_referenced_packages

import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:intl/intl.dart';
import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:mlk_ja/common/size.dart';
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
        .where((event) =>
            event.date.subtract(Duration(
                  hours: event.date.hour,
                  minutes: event.date.minute,
                )) ==
                day &&
            event.type == (filter ?? event.type))
        .toList();

    return BlocConsumer<CalendarBloc, CalendarState>(
      listener: (context, state) {},
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(
          top: marginXS(context).height,
          left: marginXXS(context).height,
          right: marginXXS(context).height,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                TableCalendar(
                  locale: 'fr_FR',
                  firstDay: DateTime.utc(2021, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: state.date,
                  onDaySelected: (selectedDay, focusedDay) =>
                      context.read<CalendarBloc>().onDateSelected(selectedDay),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (day) => isSameDay(state.date, day),
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
                          color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      border: Border.all(
                          color: Theme.of(context).colorScheme.tertiary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    markerDecoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                    weekendTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  eventLoader: (day) => getEvent(day, state.type),
                  availableCalendarFormats: const {
                    CalendarFormat.month: 'Month'
                  },
                  calendarBuilders: CalendarBuilders(
                    headerTitleBuilder: (context, day) {
                      return Text(
                        DateFormat('MMMM y', 'fr_FR').format(day).toTitleCase(),
                        textAlign: TextAlign.center,
                        style: TextL(
                            textColor: Theme.of(context).colorScheme.primary,
                            isBold: true),
                      );
                    },
                    dowBuilder: (context, day) {
                      return Text(
                        DateFormat('E', 'fr_FR').format(day).toTitleCase(),
                        textAlign: TextAlign.center,
                        style: TextS(
                            textColor: Theme.of(context).colorScheme.secondary,
                            isBold: true),
                      );
                    },
                  ),
                ),
                Text('Flitrer :',
                    style: TextS(
                        textColor: Theme.of(context).colorScheme.secondary)),
                SizedBox(
                  height: screen(context).width * 0.15,
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
                      .map((event) => Padding(
                            padding: EdgeInsets.all(marginXXS(context).width),
                            child: EventCard(context, event: event),
                          ))
                      .toList()
                  : [
                      Padding(
                        padding: EdgeInsets.all(marginXXS(context).height),
                        child: const Text('Aucun évènement'),
                      )
                    ]),
        ),
      ),
    );
  }
}
