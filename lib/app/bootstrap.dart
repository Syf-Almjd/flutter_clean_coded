import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/app/di/setup/app_config_setup.dart';
import 'package:flutter_clean_coded/app/di/setup/app_exception_setup.dart';
import 'package:flutter_clean_coded/app/di/setup/app_firebase_setup.dart';
import 'package:flutter_clean_coded/app/di/setup/app_notifications_setup.dart';
import 'package:flutter_clean_coded/app/observers/app_bloc_observer.dart';
import 'package:flutter_clean_coded/app/di/service_locator.dart';
import 'package:flutter_clean_coded/shared/helpers/navigation/navi_cubit.dart';

import 'package:flutter_clean_coded/app/l10n/locale_cubit.dart';

class AppBootstrap {
  static Future<void> init() async {
    await bootstrap();
  }

  static Future<void> bootstrap() async {
    WidgetsFlutterBinding.ensureInitialized();
    await ServiceLocator.init();
    await AppFirebaseSetup.init();
    await AppBlocObserver.init();
    await AppNotificationSetup.init();
    await AppConfigSetup.init();
    await AppExceptionSetup.init();
  }

  static List<BlocProvider> appBlocProviders() {
    return [
      BlocProvider<NaviCubit>(create: (context) => NaviCubit()),
      BlocProvider<LocaleCubit>(create: (context) => LocaleCubit()),
    ];
  }

  static void newUserPermissions() {
    AppNotificationSetup().requestPermission();
  }
}
