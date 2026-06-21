import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/app/app.dart';
import 'package:flutter_clean_coded/app/bootstrap.dart';

void main() async {
  await AppBootstrap.init();
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}
