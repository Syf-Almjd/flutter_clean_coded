import 'package:flutter/material.dart';
import 'package:flutter_clean_coded/src/core/themes/styles/app_colors.dart';

extension MediaQueryExtension on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  double get width => _size.width;

  double get height => _size.height;
}

extension WithOpacityExtension on Color {
  Color withOpacityPercent(double opacity) {
    assert(opacity >= 0 && opacity <= 1, 'Opacity must be between 0.0 and 1.0');
    return withAlpha((255 * opacity).toInt());
  }
}

extension MonthName on int {
  String get dateMonthName {
    switch (this) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}

extension StringCasingExtension on String {
  String toCapitalize() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(
        RegExp(' +'),
        ' ',
      ).split(' ').map((str) => str.toCapitalize()).join(' ');
}
