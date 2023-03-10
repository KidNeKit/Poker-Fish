import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: darkBlueColor,
  textTheme: _textTheme,
);

TextTheme _textTheme = TextTheme(
  labelLarge: _labelLarge,
  labelMedium: _labelMedium,
  labelSmall: _labelSmall,
);

TextStyle _labelLarge = TextStyle(
  fontSize: 24,
  color: pinkColor,
);

TextStyle _labelMedium = TextStyle(
  fontSize: 20,
  color: pinkColor,
);

TextStyle _labelSmall = TextStyle(
  fontSize: 16,
  color: pinkColor,
);
