import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppNetworkConstants {
  // API
  static String networkApiUrl = dotenv.env['API_URL'] ?? ""; //get from env
  // static const String localApiUrl = "http://192.168.147.1:9000";
  static String baseApiUrl = networkApiUrl;
  static const int apiTimeOut = 60;
  static const String contentType = "application/json";

  static const String signUpEndpoint = "/api/auths/signup";
  static const String loginEndpoint = "/api/auths/login";
  static const String adminAppSettingsEndPoint = "/api/settings";
}
