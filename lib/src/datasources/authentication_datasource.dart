import 'package:firebase_auth/firebase_auth.dart';

/// [AuthenticationDatasource] is a bridge between an app and FirebaseAuth
abstract interface class AuthenticationDatasource {
  factory AuthenticationDatasource(
    FirebaseAuth firebaseAuth,
  ) = _AuthenticationDatasourceImpl;

  /// [isUserAuthorized] returns `true` when firebase currentUser isn't null
  bool get isUserAuthorized;
}

final class _AuthenticationDatasourceImpl implements AuthenticationDatasource {
  _AuthenticationDatasourceImpl(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  @override
  bool get isUserAuthorized => _firebaseAuth.currentUser != null;
}
