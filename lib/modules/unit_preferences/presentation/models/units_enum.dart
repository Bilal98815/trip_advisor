part of 'models.dart';

enum Units { imperial, metric }

extension UnitsX on Units {
  Unit get unit {
    switch (this) {
      case Units.imperial:
        return Unit(
          largerUnit: LocaleStrings.unitsImperialLarge,
          smallerUnit: LocaleStrings.unitsImperialSmall,
        );
      case Units.metric:
        return Unit(
          largerUnit: LocaleStrings.unitsMetricLarge,
          smallerUnit: LocaleStrings.unitsMetricSmall,
        );
    }
  }
}
