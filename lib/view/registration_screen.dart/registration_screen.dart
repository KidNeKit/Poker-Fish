import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/registration/registration_cubit.dart';
import '../../models/enums/operation_status.dart';
import '../global_components/custom_button.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationCubit, RegistrationState>(
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
              text: 'Sign Up',
              onPressedFunc: () {
                context.read<RegistrationCubit>().signUpWithEmailAndPassword();
              },
            ),
            CustomButton(
              text: 'To Login',
              onPressedFunc: () {
                Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName);
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
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => TextField(
        onChanged: (value) =>
            context.read<RegistrationCubit>().emailChanged(value),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => TextField(
        onChanged: (value) =>
            context.read<RegistrationCubit>().passwordChanged(value),
      ),
    );
  }
}
