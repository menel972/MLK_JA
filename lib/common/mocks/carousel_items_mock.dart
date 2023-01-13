import 'package:mlk_ja/common/enums.dart';
import 'package:mlk_ja/home/presentation/models/ui_event.dart';

List<UiEvent> carouselItemsMocked = [
  UiEvent(
    uid: '1',
    type: AfterType.worship,
    date: DateTime.utc(2023, 1, 7),
  ),
  UiEvent(
    uid: '2',
    type: AfterType.talk,
    date: DateTime.utc(2023, 1, 14),
  ),
  UiEvent(
    uid: '3',
    type: AfterType.chill,
    date: DateTime.utc(2023, 1, 21),
  ),
  UiEvent(
    uid: '4',
    type: AfterType.worship,
    date: DateTime.utc(2023, 2, 4),
  ),
  UiEvent(
    uid: '5',
    type: AfterType.talk,
    date: DateTime.utc(2023, 2, 11),
  ),
  UiEvent(
    uid: '6',
    type: AfterType.open,
    date: DateTime.utc(2023, 2, 18),
  ),
  UiEvent(
    uid: '6',
    type: AfterType.mlk,
    date: DateTime.utc(2023, 2, 18),
  ),
];
