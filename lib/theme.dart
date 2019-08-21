
import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/utils.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(fontFamily: AvailableFonts.primaryFont);

  return baseTheme.copyWith(
    primaryColor: primaryColor,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    scaffoldBackgroundColor: scaffoldColor,
    appBarTheme: AppBarTheme(
      color: appBarColor,
    ),
  );
}
