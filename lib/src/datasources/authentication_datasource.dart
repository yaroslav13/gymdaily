import 'package:firebase_auth/firebase_auth.dart';
import 'package:gym_daily/src/entities/user_credentials/user_credentials.dart';
import 'package:gym_daily/src/exceptions/authentication_exception.dart';
import 'package:gym_daily/src/mappers/authentication_exception_mapper.dart';
import 'package:logger/logger.dart';

/// [AuthenticationDatasource] is a bridge between an app and FirebaseAuth
abstract interface class AuthenticationDatasource {
  factory AuthenticationDatasource(
    FirebaseAuth firebaseAuth,
    AuthenticationExceptionMapper authenticationExceptionMapper,
    Logger logger,
  ) = _AuthenticationDatasourceImpl;

  /// [isUserAuthorized] returns `true` when firebase currentUser isn't null
  bool get isUserAuthorized;

  Future<void> logIn(UserCredentials credentials);
}

final class _AuthenticationDatasourceImpl implements AuthenticationDatasource {
  _AuthenticationDatasourceImpl(
    this._firebaseAuth,
    this._authenticationExceptionMapper,
    this._logger,
  );

  final FirebaseAuth _firebaseAuth;
  final AuthenticationExceptionMapper _authenticationExceptionMapper;

  final Logger _logger;

  @override
  bool get isUserAuthorized => _firebaseAuth.currentUser != null;

  @override
  Future<void> logIn(UserCredentials credentials) async {
    try {
      final UserCredentials(:email, :password) = credentials;

      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error, stackTrace) {
      _logger.w(
        'AuthenticationDatasource#${identityHashCode(this)} -> logIn',
        error: error,
        stackTrace: stackTrace,
      );

      final authenticationException =
          _authenticationExceptionMapper.map(error) ??
              const UnknownAuthenticationException();

      Error.throwWithStackTrace(authenticationException, stackTrace);
    }
  }
}
