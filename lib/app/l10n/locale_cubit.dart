import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/app/di/service_locator.dart';
import 'package:flutter_clean_coded/app/l10n/app_localizations.dart';
import 'package:flutter_clean_coded/core/enums/app_enums.dart';
import 'package:clean_arch_kit/clean_arch_kit.dart';
import 'package:flutter_clean_coded/shared/utils/local_constants.dart';

/// Cubit managing the application-wide locale/language preference.
class LocaleCubit extends Cubit<AppLocale> {
  LocaleCubit() : super(AppLocale.english) {
    _loadLocale();
  }

  static LocaleCubit get(BuildContext context) => BlocProvider.of<LocaleCubit>(context);

  /// Loads the saved locale from local storage.
  void _loadLocale() {
    try {
      if (ServiceLocator.getIt.isRegistered<LocalStorage>()) {
        final localStorage = ServiceLocator.getIt<LocalStorage>();
        final savedLocaleStr = localStorage.getString(AppLocalConstants.appLocale);
        if (savedLocaleStr != null) {
          final savedLocale = AppLocale.values.firstWhere(
            (e) => e.name == savedLocaleStr,
            orElse: () => AppLocale.english,
          );
          appDefaultLocale = savedLocale;
          emit(savedLocale);
        }
      }
    } catch (_) {
      // Fallback to default English if storage read fails
    }
  }

  /// Updates and persists the chosen locale.
  Future<void> changeLocale(AppLocale locale) async {
    appDefaultLocale = locale;
    emit(locale);
    try {
      if (ServiceLocator.getIt.isRegistered<LocalStorage>()) {
        final localStorage = ServiceLocator.getIt<LocalStorage>();
        await localStorage.setString(AppLocalConstants.appLocale, locale.name);
      }
    } catch (_) {}
  }
}
