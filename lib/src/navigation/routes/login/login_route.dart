part of '../routes.dart';

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
final class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}
