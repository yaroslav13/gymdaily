import 'package:flutter/material.dart';
import 'package:gym_daily/src/entities/auth/authentication_status.dart';
import 'package:gym_daily/src/navigation/routes/routes.dart';
import 'package:gym_daily/src/providers/auth/authentication_state_provider.dart';
import 'package:gym_daily/src/resources/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

/// The [SplashScreen] is initial screen of app.
final class SplashScreen extends HookConsumerWidget {
  /// Creates an instance of [SplashScreen]
  const SplashScreen({super.key});

  Future<void> _onWorkoutLottieLoaded(
    BuildContext context,
    LottieComposition composition,
    AuthenticationStatus authenticationStatus,
  ) async {
    await Future<void>.delayed(composition.duration);
    if (!context.mounted) {
      return;
    }

    switch (authenticationStatus) {
      case AuthenticationStatus.authenticated:
      // TODO: Navigate to [HomeScreen].
      case AuthenticationStatus.unauthenticated:
        const LoginRoute().go(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.lotties.workout,
          onLoaded: (composition) => _onWorkoutLottieLoaded(
            context,
            composition,
            ref.read(authenticationStateProvider),
          ),
        ),
      ),
    );
  }
}
