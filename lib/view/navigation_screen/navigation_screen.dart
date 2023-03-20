import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/navigation/navigation_cubit.dart';
import '../cash_lobbies_screen/cash_lobbies_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../spin_lobby_screen/spin_lobby_screen.dart';
import 'components/nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  static const String routeName = '/home';
  final List<Widget> _screens = const [
    CashLobbyScreen(),
    SpinLobbyScreen(),
    ProfileScreen(),
  ];

  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return _screens[state.index];
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
