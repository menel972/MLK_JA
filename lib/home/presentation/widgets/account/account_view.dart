import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final Event event = Event(
      title: 'Test',
      startDate: DateTime.utc(2023, 1, 19, 10),
      endDate: DateTime.utc(2023, 1, 19, 12),
    );

    return Center(
      child: ElevatedButton(
        onPressed: () => Add2Calendar.addEvent2Cal(event),
        child: const Text('Test Calendar'),
      ),
    );
  }
}
