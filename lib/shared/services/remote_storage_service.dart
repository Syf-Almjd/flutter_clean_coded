import 'package:dio/dio.dart';
import 'package:flutter_clean_coded/app/di/service_locator.dart';
import 'package:flutter_clean_coded/core/network/network_constants.dart';

Dio getDioClient() {
  return ServiceLocator.getIt<Dio>();
}

// Method to get API URL
String getApiUrl(String endpoint) {
  String apiUrl = '${AppNetworkConstants.baseApiUrl}$endpoint';
  return apiUrl;
}
