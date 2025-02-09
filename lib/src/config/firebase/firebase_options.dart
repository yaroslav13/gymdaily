import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:gym_daily/src/config/firebase/firebase_options_dev.dart' as dev;
import 'package:gym_daily/src/config/firebase/firebase_options_prod.dart'
    as prod;
import 'package:gym_daily/src/config/flavor/flavor.dart';
import 'package:gym_daily/src/config/flavor/flavor_type.dart';

class FlavoredFirebaseOptions {
  const FlavoredFirebaseOptions._();

  static FirebaseOptions get currentPlatform {
    return switch (Flavor.type) {
      FlavorType.prod => prod.DefaultFirebaseOptions.currentPlatform,
      FlavorType.dev => dev.DefaultFirebaseOptions.currentPlatform,
    };
  }
}
