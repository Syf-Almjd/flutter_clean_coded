import 'package:clean_arch_kit/clean_arch_kit.dart';
import 'package:flutter_clean_coded/features/auth/data/datasources/auth_remote_source.dart';
import 'package:flutter_clean_coded/features/auth/domain/repositories/auth_repository.dart';

/// Implementation connecting domain request to datasource logic safely.
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;

  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<ApiResult<String>> login(String email, String password) {
    return safeApiCall(() => _remoteSource.login(email, password));
  }

  @override
  Future<ApiResult<void>> logout() {
    return safeApiCall(() async {
      // Clear token, logout etc.
    });
  }
}
