sealed class AuthenticationException implements Exception {
  const AuthenticationException();
}

final class InvalidEmailException extends AuthenticationException {
  const InvalidEmailException();
}

final class UserDisabledException extends AuthenticationException {
  const UserDisabledException();
}

final class UserNotFoundException extends AuthenticationException {
  const UserNotFoundException();
}

final class WrongPasswordException extends AuthenticationException {
  const WrongPasswordException();
}

final class UnknownAuthenticationException extends AuthenticationException {
  const UnknownAuthenticationException();
}
