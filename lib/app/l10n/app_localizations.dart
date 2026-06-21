import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_coded/app/l10n/languages/chinese_language.dart';
import 'package:flutter_clean_coded/app/l10n/languages/italian_language.dart';
import 'package:flutter_clean_coded/core/enums/app_enums.dart';
import 'package:flutter_clean_coded/app/l10n/locale_cubit.dart';

AppLocale appDefaultLocale = AppLocale.english;

/// Normalize and lowercase translation keys once
final Map<AppLocale, Map<String, String>> _localizedMaps = {
  AppLocale.italian: {
    for (var entry in italianTranslations.entries)
      entry.key.toLowerCase(): entry.value,
  },
  AppLocale.chinese: {
    for (var entry in chineseTranslations.entries)
      entry.key.toLowerCase(): entry.value,
  },
};

/// Get translated text from the active locale, with optional overrides.
String getLocaleText(String key, {AppLocale? locale}) {
  final normalizedKey = key.toLowerCase();
  final activeLocale = locale ?? appDefaultLocale;
  final translations = _localizedMaps[activeLocale];

  return translations?[normalizedKey] ?? key;
}

/// Extension on [BuildContext] for cleaner, reactive translation references in UI build trees.
extension AppLocalizationsExtension on BuildContext {
  /// Translates the given key based on the active state of [LocaleCubit].
  ///
  /// Using this registers a reactive dependency on the LocaleCubit,
  /// causing the widget to rebuild automatically when the language is changed.
  String translate(String key) {
    try {
      final activeLocale = watch<LocaleCubit>().state;
      return getLocaleText(key, locale: activeLocale);
    } catch (_) {
      // Fallback if LocaleCubit is not available in the context tree
      return getLocaleText(key);
    }
  }

  /// Returns the current active [AppLocale].
  AppLocale get currentLocale {
    try {
      return watch<LocaleCubit>().state;
    } catch (_) {
      return appDefaultLocale;
    }
  }
}

