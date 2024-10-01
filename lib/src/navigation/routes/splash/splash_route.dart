import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_daily/src/features/splash/splash_screen.dart';

part 'splash_route.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/',
)

/// The [SplashRoute] is route for [SplashScreen]
final class SplashRoute extends GoRouteData {
  /// Creates an instance of [SplashRoute]
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}
