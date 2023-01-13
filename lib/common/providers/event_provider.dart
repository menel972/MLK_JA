import 'package:flutter/material.dart';
import 'package:mlk_ja/home/presentation/models/ui_event.dart';

class EventProvider extends ChangeNotifier {
  List<UiEvent> _events = [];

  List<UiEvent> get events => _events;

  List<UiEvent> get filteredEvents =>
      _events.where((item) => item.date.month == DateTime.now().month).toList();

  UiEvent get lastEvent {
    List<UiEvent> previousEvents =
        _events.where((event) => event.date.isBefore(DateTime.now())).toList();

    previousEvents.sort((a, b) => a.date.compareTo(b.date));

    return previousEvents.last;
  }

  void initEvents(List<UiEvent> items) {
    _events = items;
    notifyListeners();
  }
}
