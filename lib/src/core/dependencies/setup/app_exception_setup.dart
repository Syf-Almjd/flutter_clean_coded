import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_coded/src/presentation/shared/app_error_handle.dart';

class AppExceptionSetup {
  static Future<void> init() async {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => CustomError(errorDetails: details);
  }
}
