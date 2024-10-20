import 'package:gym_daily/src/entities/auth/authentication_status.dart';
import 'package:gym_daily/src/providers/auth/authentication_datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_state_provider.g.dart';

@riverpod
class AuthenticationState extends _$AuthenticationState {
  @override
  AuthenticationStatus build() {
    final authenticationDatasource =
        ref.watch(authenticationDatasourceProvider);
    final isUserAuthorized = authenticationDatasource.isUserAuthorized;

    return switch (isUserAuthorized) {
      true => AuthenticationStatus.authenticated,
      false => AuthenticationStatus.unauthenticated,
    };
  }
}
