import 'package:flutter_clean_coded/src/core/localization/languages/chinese_language.dart';
import 'package:flutter_clean_coded/src/core/localization/languages/italian_language.dart';
import 'package:flutter_clean_coded/src/core/utils/managers/app_enums.dart';

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

/// Get translated text from the active locale
String getLocaleText(String key) {
  final normalizedKey = key.toLowerCase();
  final translations = _localizedMaps[appDefaultLocale];

  return translations?[normalizedKey] ?? key;
}
