import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_coded/shared/widgets/app_error_view.dart';

class AppExceptionSetup {
  static Future<void> init() async {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => CustomError(errorDetails: details);
  }
}
