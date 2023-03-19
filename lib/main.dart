import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/cash_lobby/lobby_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/cash_lobby_repository.dart';
import 'resources/themes.dart';
import 'router/app_router.dart';
import 'view/splash_screen.dart/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _authRepository,
        ),
        RepositoryProvider(
          create: (context) => CashLobbyRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(authRepository: _authRepository),
          ),
          BlocProvider(
            create: (_) => LobbyBloc()..add(FetchLobbies()),
          ),
        ],
        child: MaterialApp(
          theme: themeData,
          themeMode: ThemeMode.light,
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
