import 'package:flutter_clean_coded/app/bootstrap.dart';
import 'package:flutter_clean_coded/app/theme/app_theme.dart';
import 'package:flutter_clean_coded/core/constants/app_constants.dart';
import 'package:flutter_clean_coded/app/router/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_coded/app/l10n/locale_cubit.dart';
import 'package:flutter_clean_coded/core/enums/app_enums.dart';

/// Main Application Entry Widget wrapping the BLoC provider and routing configuration.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBootstrap.appBlocProviders(),
      child: BlocBuilder<LocaleCubit, AppLocale>(
        builder: (context, appLocale) {
          Locale systemLocale;
          switch (appLocale) {
            case AppLocale.chinese:
              systemLocale = const Locale('zh', 'CN');
              break;
            case AppLocale.italian:
              systemLocale = const Locale('it', 'IT');
              break;
            case AppLocale.english:
              systemLocale = const Locale('en', 'US');
              break;
          }

          return MaterialApp.router(
            locale: DevicePreview.locale(context) ?? systemLocale,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: AppConstants.appTitle,
            theme: getApplicationTheme(),
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
