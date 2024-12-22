import 'package:go_router/go_router.dart';
import 'package:gym_daily/src/navigation/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

/// The [router] func is pattern for riverpod_generator.
/// It returns an instance of application router.
@riverpod
GoRouter router(Ref ref) {
  return GoRouter(routes: $appRoutes);
}
