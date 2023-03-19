import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';
import '../../global_components/custom_button.dart';
import '../../registration_screen/registration_screen.dart';
import 'login_text_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const LoginTetFields(),
        const SizedBox(height: 10.0),
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
    );
  }
}
