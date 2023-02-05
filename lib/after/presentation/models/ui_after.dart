import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:equatable/equatable.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:mlk_ja/common/enums.dart';

class UiAfter extends Equatable {
  final String uid;
  final AfterType type;
  final String? name;
  final String? description;
  final List<UiGuest> guests;
  final String? url;
  final DateTime date;
  final Duration duration;
  final String? image;
  final String location;
  final String city;
  final Coords? coords;

  const UiAfter({
    required this.uid,
    required this.type,
    this.name,
    this.description,
    required this.guests,
    this.url,
    required this.date,
    this.duration = const Duration(hours: 2),
    this.image,
    this.location = 'Espace Martin Luther King',
    this.city = 'Créteil',
    this.coords,
  });

  @override
  List<Object?> get props => [
        uid,
        type,
        name,
        description,
        guests,
        url,
        date,
        duration,
        image,
        location,
        city,
        coords
      ];
  String get _locationLabel => '$location, $city';

  Event toEvent() => Event(
        title: name ?? type.value,
        startDate: date.subtract(const Duration(hours: 1)),
        endDate: (date.add(duration)).subtract(const Duration(hours: 1)),
        description: description,
        location: _locationLabel,
      );
}

class UiGuest extends Equatable {
  final String name;
  final String? url;

  const UiGuest(this.name, {this.url});

  @override
  List<Object?> get props => [name, url];
}
