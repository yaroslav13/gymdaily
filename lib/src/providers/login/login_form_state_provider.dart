import 'package:formz/formz.dart';
import 'package:gym_daily/src/features/login/inputs/email_input.dart';
import 'package:gym_daily/src/features/login/inputs/password_input.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_form_state_provider.g.dart';

@riverpod
class LoginFormState extends _$LoginFormState {
  @override
  LoginFormInput build() => const LoginFormInput();

  void onEmailChanged(String email) {
    final input = EmailInput.dirty(
      email.trim(),
    );

    state = state.copyWith(email: input);
  }

  void onPasswordChanged(String password) {
    final input = PasswordInput.dirty(
      password.trim(),
    );

    state = state.copyWith(password: input);
  }

  Future<void> onLogIn() async {
    try {
      /// TODO: implementation of log in method
    } on Exception {
      // TODO: Error handling
    }
  }
}

final class LoginFormInput with FormzMixin {
  const LoginFormInput({
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  final EmailInput email;
  final PasswordInput password;

  LoginFormInput copyWith({
    EmailInput? email,
    PasswordInput? password,
  }) {
    return LoginFormInput(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<FormzInput<String, dynamic>> get inputs => [
        email,
        password,
      ];
}
