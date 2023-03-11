import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: darkBlueColor,
  accentColor: darkPurpleColor,
  //buttonTheme: _buttonTheme,
  textTheme: _textTheme,
);

TextTheme _textTheme = TextTheme(
  labelLarge: _labelLarge,
  labelMedium: _labelMedium,
  labelSmall: _labelSmall,
);

// ButtonThemeData _buttonTheme = ButtonThemeData(
//   buttonColor: darkPurpleColor,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(20.0),
//   ),
// );

TextStyle _labelLarge = const TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle _labelMedium = const TextStyle(
  fontSize: 20,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

TextStyle _labelSmall = const TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
