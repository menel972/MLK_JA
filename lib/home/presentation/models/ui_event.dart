import 'package:equatable/equatable.dart';
import 'package:mlk_ja/common/enums.dart';

class UiEvent extends Equatable {
  final String uid;
  final AfterType type;
  final DateTime date;
  final String? image;
  final String? name;
  final String? url;

  const UiEvent({
    required this.uid,
    required this.type,
    required this.date,
    this.image,
    this.name,
    this.url,
  });

  @override
  List<Object?> get props => [uid, type, image, date, name, url];
}
