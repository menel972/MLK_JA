import 'package:flutter/material.dart';
import 'package:mlk_ja/home/presentation/models/ui_after_preview.dart';

class EventProvider extends ChangeNotifier {
  List<UiAfterPreview> _events = [];

  List<UiAfterPreview> get events => _events;

  List<UiAfterPreview> get currentMonthEvents => _events
      .where((UiAfterPreview item) => item.date.month == DateTime.now().month)
      .toList();

  UiAfterPreview get lastEvent {
    List<UiAfterPreview> previousEvents = _events
        .where((UiAfterPreview event) => event.date.isBefore(DateTime.now()))
        .toList();

    previousEvents
        .sort((UiAfterPreview a, UiAfterPreview b) => a.date.compareTo(b.date));

    return previousEvents.last;
  }

  void initEvents(List<UiAfterPreview> items) {
    _events = items;
    notifyListeners();
  }
}
