import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import '../cubits/navigation/navigation_cubit.dart';
import '../cubits/registration/registration_cubit.dart';
import '../repositories/auth_repository.dart';
import '../view/login_screen/login_screen.dart';
import '../view/navigation_screen/navigation_screen.dart';
import '../view/registration_screen.dart/registration_screen.dart';
import '../view/splash_screen.dart/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
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
      default:
        return null;
    }
  }
}
