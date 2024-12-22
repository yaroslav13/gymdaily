import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:gym_daily/src/resources/translations.g.dart';

enum EmailInputValidationError { empty, invalid }

final class EmailInput extends FormzInput<String, EmailInputValidationError> {
  const EmailInput.pure([super.value = '']) : super.pure();

  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailInputValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputValidationError.empty;
    }

    return _emailRegExp.hasMatch(value)
        ? null
        : EmailInputValidationError.invalid;
  }
}

extension EmailInputValidationErrorX on EmailInputValidationError {
  String translate(BuildContext context) {
    final translations = context.t;

    return switch (this) {
      EmailInputValidationError.empty => translations.enterEmail,
      EmailInputValidationError.invalid => translations.enterValidEmail,
    };
  }
}
