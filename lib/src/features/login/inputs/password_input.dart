import 'package:formz/formz.dart';

/// [PasswordInput] validation error
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is less then 8 characters
  invalidCharactersNumber,

  /// Password not contains a lowercase
  notContainsLowercase,

  /// Password not contains a uppercase
  notContainsUppercase,

  /// Password not contains a digit
  notContainsDigits,

  /// Password not contains a special character
  notContainsSpecialCharacters,
}

final class PasswordInput extends FormzInput<String, PasswordValidationError> {
  /// Pure representation of [PasswordInput]
  const PasswordInput.pure([String value = '']) : super.pure(value);

  /// Dirty representation of [PasswordInput]
  const PasswordInput.dirty([String value = '']) : super.dirty(value);

  static final _containsLowercaseRegex = RegExp('(?=.*[a-z])');
  static final _containsUppercaseRegex = RegExp('(?=.*[A-Z])');
  static final _containsDigitRegex = RegExp(r'(.*\d.*)');
  static final _containsSpecialCharacterRegex = RegExp(r'(?=.*\W)');

  static const _passwordLength = 8;

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (value.length < _passwordLength) {
      return PasswordValidationError.invalidCharactersNumber;
    }

    if (!_containsLowercaseRegex.hasMatch(value)) {
      return PasswordValidationError.notContainsLowercase;
    }
    if (!_containsUppercaseRegex.hasMatch(value)) {
      return PasswordValidationError.notContainsUppercase;
    }

    if (!_containsDigitRegex.hasMatch(value)) {
      return PasswordValidationError.notContainsDigits;
    }

    if (!_containsSpecialCharacterRegex.hasMatch(value)) {
      return PasswordValidationError.notContainsSpecialCharacters;
    }
    return null;
  }
}
