import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/single_lobby/single_lobby_bloc.dart';
import '../cubits/login/login_cubit.dart';
import '../cubits/navigation/navigation_cubit.dart';
import '../cubits/registration/registration_cubit.dart';
import '../models/enums/lobby_type.dart';
import '../repositories/auth_repository.dart';
import '../repositories/base_lobby_repository.dart';
import '../repositories/cash_lobby_repository.dart';
import '../view/login_screen/login_screen.dart';
import '../view/navigation_screen/navigation_screen.dart';
import '../view/registration_screen/registration_screen.dart';
import '../view/splash_screen/splash_screen.dart';
import '../view/table_screen/table_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = (settings.arguments ?? {}) as Map<dynamic, dynamic>;
    switch (settings.name) {
      case NavigationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<NavigationCubit>(
              create: (_) => NavigationCubit(),
              child: const NavigationScreen(),
            );
          },
        );
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
            child: const LoginScreen(),
          ),
        );
      case RegistrationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegistrationCubit(
                authRepository: context.read<AuthRepository>()),
            child: const RegistrationScreen(),
          ),
        );
      case TableScreen.routeName:
        late BaseLobbyRepository lobbyRepository;
        String lobbyId = args['lobbyId'];
        LobbyType lobbyType = args['lobbyType'];
        switch (lobbyType) {
          case LobbyType.cash:
            lobbyRepository = CashLobbyRepository();
            break;
          case LobbyType.spin:
            lobbyRepository = CashLobbyRepository();
            //todo switch to another repository
            break;
          default:
            lobbyRepository = CashLobbyRepository();
            break;
        }
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider<SingleLobbyBloc>(
              create: (_) => SingleLobbyBloc(lobbyRepository: lobbyRepository)
                ..add(LobbySelected(lobbyId: lobbyId)),
              child: const TableScreen(),
            );
          },
        );
      default:
        return null;
    }
  }
}
