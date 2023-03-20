import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../blocs/lobbies/lobbies_bloc.dart';
import '../../resources/init_data/init_cash_lobbies.dart';
import '../login_screen/login_screen.dart';
import '../navigation_screen/navigation_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<LobbiesBloc>().add(CashLobbyCreated(cashLobbies: cashLobbies));
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user.isEmpty) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        } else {
          Navigator.of(context)
              .pushReplacementNamed(NavigationScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
          child: Text('Splash'),
        ),
      ),
    );
  }
}
