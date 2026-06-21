import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_coded/shared/services/local_storage_database.dart';
import 'package:flutter_clean_coded/shared/services/secure_storage_database.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';
import 'package:flutter_clean_coded/features/auth/data/datasources/auth_remote_source.dart';
import 'package:flutter_clean_coded/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_clean_coded/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_coded/features/auth/domain/usecases/login_use_case.dart';

/// Central Dependency Injection container setup.
///
/// Orchestrates the initialization of core services and feature-specific dependencies.
class ServiceLocator {
  ServiceLocator._();

  static final GetIt getIt = GetIt.instance;

  /// Initializes all system-wide and module DI setups.
  static Future<void> init() async {
    // 1. External dependencies
    final sharedPrefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPrefs);
    
    const secureStorage = FlutterSecureStorage();
    getIt.registerSingleton<FlutterSecureStorage>(secureStorage);

    // 2. Storage wrappers implementing clean_arch_kit interfaces
    getIt.registerSingleton<LocalStorage>(
      LocalStorageDatabase(sharedPreferences: sharedPrefs),
    );
    getIt.registerLazySingleton<SecureStorage>(
      () => SecureStorageDatabase(secureStorage: secureStorage),
    );

    // 3. Network layer
    getIt.registerSingleton<Dio>(Dio());

    // 4. Feature Modules DI setup
    _initAuthModule();
  }

  /// Registers dependencies for the authentication module.
  static void _initAuthModule() {
    getIt.registerLazySingleton<AuthRemoteSource>(
      () => AuthRemoteSourceImpl(getIt<Dio>()),
    );
    getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteSource>()),
    );
    getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(getIt<AuthRepository>()),
    );
  }

  /// Resets the DI container registrations.
  static void reset() => getIt.reset();
}
