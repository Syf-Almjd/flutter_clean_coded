import 'package:dio/dio.dart';

/// Contract representing external API interactions for authentication.
abstract interface class AuthRemoteSource {
  /// Calls the login API.
  Future<String> login(String email, String password);
}

/// Remote implementation utilizing [Dio] network clients.
class AuthRemoteSourceImpl implements AuthRemoteSource {
  final Dio _dio;

  AuthRemoteSourceImpl(this._dio);

  @override
  Future<String> login(String email, String password) async {
    // API endpoint call logic, returning token on success.
    // Replace with real dio call, e.g.
    // final response = await _dio.post('/login', data: {'email': email, 'password': password});
    // return response.data['token'];
    await Future.delayed(const Duration(seconds: 1)); // Simulate server delay
    return 'mock-jwt-token';
  }
}
