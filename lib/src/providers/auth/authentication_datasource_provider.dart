import 'package:gym_daily/src/datasources/authentication_datasource.dart';
import 'package:gym_daily/src/providers/firebase/firebase_auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_datasource_provider.g.dart';

@riverpod
AuthenticationDatasource authenticationDatasource(
  Ref ref,
) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return AuthenticationDatasource(firebaseAuth);
}
