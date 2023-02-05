import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlk_ja/common/enums.dart';

class CalendarBloc extends Cubit<CalendarState> {
  CalendarBloc() : super(CalendarState(DateTime.now(), null));

  void onDateSelected(DateTime date) => emit(state.setDate(date));
  void onFilterSelected(AfterType filter) {
    if (state.type == filter) return emit(state.setType(null));
    return emit(state.setType(filter));
  }
}

class CalendarState {
  final DateTime date;
  final AfterType? type;

  CalendarState(this.date, this.type);

  CalendarState setDate(DateTime date) => CalendarState(date, type);
  CalendarState setType(AfterType? type) => CalendarState(date, type);
}
