import 'package:flutter/services.dart';
import 'package:gym_daily/src/config/flavor/flavor_type.dart';

class Flavor {
  const Flavor._();

  static FlavorType get type {
    return _fromEnvironment();
  }

  static FlavorType _fromEnvironment() {
    const flavour = appFlavor;
    final type = FlavorType.values.firstWhere(
          (type) => type.name == flavour,
      orElse: () => throw Exception('Unsupported flavor $flavour.'),
    );
    return type;
  }
}
