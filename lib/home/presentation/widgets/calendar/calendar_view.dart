// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;
import 'package:mlk_ja/common/providers/event_provider.dart';
import 'package:mlk_ja/common/size.dart';
import 'package:mlk_ja/home/presentation/models/ui_event.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/bloc/calendar_bloc.dart';
import 'package:mlk_ja/home/presentation/widgets/calendar/widgets/event_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class CalendarView extends riverpod.HookConsumerWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context, riverpod.WidgetRef ref) {
    List<UiEvent> events = Provider.of<EventProvider>(context).events;

    List<UiEvent> getEvent(DateTime day) =>
        events.where((event) => event.date == day).toList();

    return BlocConsumer<CalendarBloc, DateTime>(
      listener: (context, state) {},
      builder: (context, state) => Padding(
        padding: EdgeInsets.only(top: marginXXS(context).height),
        child: Column(
          children: <Widget>[
                TableCalendar(
                  locale: 'fr_FR',
                  firstDay: DateTime.utc(2021, 3, 1),
                  lastDay: DateTime.utc(2024, 12, 31),
                  focusedDay: state,
                  onDaySelected: (selectedDay, focusedDay) =>
                      context.read<CalendarBloc>().onDateSelected(selectedDay),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (day) {
                    return isSameDay(state, day);
                  },
                  weekendDays: const [
                    DateTime.monday,
                    DateTime.tuesday,
                    DateTime.wednesday,
                    DateTime.thursday,
                    DateTime.friday,
                  ],
                  calendarStyle: const CalendarStyle(
                    outsideDaysVisible: false,
                    todayDecoration: BoxDecoration(
                        color: Colors.black38, shape: BoxShape.circle),
                    selectedDecoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    markerDecoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.black54),
                    outsideTextStyle: TextStyle(color: Colors.black26),
                  ),
                  eventLoader: (day) => getEvent(day),
                ),
              ] +
              (getEvent(state).isNotEmpty
                  ? getEvent(state)
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
