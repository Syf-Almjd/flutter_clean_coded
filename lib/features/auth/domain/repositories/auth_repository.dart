import 'package:clean_arch_kit/clean_arch_kit.dart';

/// Contract representing authentication related data flows.
abstract interface class AuthRepository implements BaseRepository {
  /// Sign in user with their [email] and [password].
  Future<ApiResult<String>> login(String email, String password);

  /// Signs the user out from the system.
  Future<ApiResult<void>> logout();
}
