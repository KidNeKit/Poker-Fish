import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/login/login_cubit.dart';
import '../../models/enums/operation_status.dart';
import '../global_components/custom_button.dart';
import '../home_screen/home_screen.dart';
import '../registration_screen.dart/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == OperationStatus.successfull) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            const LoginForm(),
            CustomButton(
              text: 'Login',
              onPressedFunc: () {
                context.read<LoginCubit>().logInWithEmailAndPassword();
              },
            ),
            CustomButton(
              text: 'To Registration',
              onPressedFunc: () {
                Navigator.of(context)
                    .pushReplacementNamed(RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        EmailInput(),
        PasswordInput(),
      ],
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => TextField(
        onChanged: (value) => context.read<LoginCubit>().emailChanged(value),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => TextField(
        onChanged: (value) => context.read<LoginCubit>().passwordChanged(value),
      ),
    );
  }
}
