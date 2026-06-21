import 'package:flutter_clean_coded/app/di/service_locator.dart';
import 'package:flutter_clean_coded/shared/services/local_storage_database.dart';
import 'package:flutter_clean_coded/shared/services/secure_storage_database.dart';

LocalStorageDatabase getLocalStorageService() {
  return ServiceLocator.getIt<LocalStorageDatabase>();
}

SecureStorageDatabase getSecureStorageService() {
  return ServiceLocator.getIt<SecureStorageDatabase>();
}
