import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_fish/blocs/auth/auth_bloc.dart';
import 'package:poker_fish/repositories/auth_repository.dart';

import 'resources/themes.dart';
import 'router/app_router.dart';
import 'view/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) async {
    await Firebase.initializeApp();
    runApp(
      PokerApp(
        appRouter: AppRouter(),
        authRepository: AuthRepository(),
      ),
    );
  });
}

class PokerApp extends StatelessWidget {
  final AppRouter _appRouter;
  final AuthRepository _authRepository;
  const PokerApp(
      {required AppRouter appRouter,
      required AuthRepository authRepository,
      super.key})
      : _appRouter = appRouter,
        _authRepository = authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepository: _authRepository),
        child: MaterialApp(
          theme: themeData,
          themeMode: ThemeMode.light,
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
