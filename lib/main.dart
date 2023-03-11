import 'package:flutter/material.dart';

import 'resources/themes.dart';
import 'router/app_router.dart';
import 'view/home_screen/home_screen.dart';

void main() {
  runApp(PokerApp(
    appRouter: AppRouter(),
  ));
}

class PokerApp extends StatelessWidget {
  final AppRouter _appRouter;
  const PokerApp({required AppRouter appRouter, super.key})
      : _appRouter = appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
