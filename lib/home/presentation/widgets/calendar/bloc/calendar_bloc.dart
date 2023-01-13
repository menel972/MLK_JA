import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarBloc extends Cubit<DateTime> {
  CalendarBloc() : super(DateTime.now());

  void onDateSelected(DateTime date) => emit(date);
}
