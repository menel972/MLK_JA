import 'package:equatable/equatable.dart';

class UiStaffMember extends Equatable {
  final String name;
  final String? image;

  const UiStaffMember(this.name, {this.image});

  @override
  List<Object?> get props => [name, image];
}
