import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_daily/src/exceptions/authentication_exception.dart';
import 'package:gym_daily/src/mappers/mapper.dart';

final class AuthenticationExceptionMapper
    with SafeMapper<AuthenticationException, FirebaseAuthException> {
  const AuthenticationExceptionMapper();

  @override
  AuthenticationException mapSafe(FirebaseAuthException instance) {
    return switch (instance.code) {
      'invalid-email' => const InvalidEmailException(),
      'user-disabled' => const UserDisabledException(),
      'user-not-found' => const UserNotFoundException(),
      'wrong-password' => const WrongPasswordException(),
      _ => const UnknownAuthenticationException(),
    };
  }
}
