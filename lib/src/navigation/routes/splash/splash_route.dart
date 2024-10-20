part of '../routes.dart';

@TypedGoRoute<SplashRoute>(path: '/')

/// The [SplashRoute] is route for [SplashScreen]
final class SplashRoute extends GoRouteData {
  /// Creates an instance of [SplashRoute]
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}
