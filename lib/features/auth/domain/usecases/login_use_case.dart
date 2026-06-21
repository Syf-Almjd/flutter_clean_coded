import 'package:clean_arch_kit/clean_arch_kit.dart';
import 'package:flutter_clean_coded/features/auth/domain/repositories/auth_repository.dart';

/// Parameters required to execute a [LoginUseCase].
class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

/// Executes authentication workflows to sign in users.
class LoginUseCase implements UseCase<String, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<ApiResult<String>> call(LoginParams params) {
    return _repository.login(params.email, params.password);
  }
}
