part of '../routes.dart';

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
final class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}
