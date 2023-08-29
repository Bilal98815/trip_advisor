part of 'models.dart';

class Unit extends Equatable {
  const Unit({required this.largerUnit, required this.smallerUnit});

  final String largerUnit;
  final String smallerUnit;

  Unit copyWith({String? largerUnit, String? smallerUnit}) {
    return Unit(
      largerUnit: largerUnit ?? this.largerUnit,
      smallerUnit: smallerUnit ?? this.smallerUnit,
    );
  }

  @override
  String toString() => '$largerUnit / $smallerUnit';

  @override
  List<Object?> get props => [largerUnit, smallerUnit];
}
