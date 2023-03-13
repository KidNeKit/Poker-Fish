import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../global_components/custom_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: constraints.maxWidth / 2,
              height: constraints.maxHeight,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: 'Lobby',
                    onPressedFunc: () {},
                  ),
                  CustomButton(
                    text: 'Lobby',
                    onPressedFunc: () {},
                  ),
                  CustomButton(
                    text: 'Lobby',
                    onPressedFunc: () {},
                  ),
                  CustomButton(
                    text: 'Logout',
                    onPressedFunc: () {
                      context.read<AuthBloc>().add(AuthLogOutRequested());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
