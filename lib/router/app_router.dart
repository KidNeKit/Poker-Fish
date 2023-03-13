import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import '../cubits/registration/registration_cubit.dart';
import '../repositories/auth_repository.dart';
import '../view/home_screen/home_screen.dart';
import '../view/login_screen/login_screen.dart';
import '../view/registration_screen.dart/registration_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
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
      default:
        return null;
    }
  }
}
