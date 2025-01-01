import 'package:gym_daily/src/mappers/authentication_exception_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_exception_mapper_provider.g.dart';

@riverpod
AuthenticationExceptionMapper authenticationExceptionMapper(Ref ref) {
  return const AuthenticationExceptionMapper();
}
