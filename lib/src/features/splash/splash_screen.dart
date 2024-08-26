import 'package:flutter/material.dart';
import 'package:gym_daily/src/resources/translations.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The [SplashScreen] is initial screen of app.
final class SplashScreen extends HookConsumerWidget {
  /// Creates an instance of [SplashScreen]
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text(context.t.gymDaily),
      ),
    );
  }
}
