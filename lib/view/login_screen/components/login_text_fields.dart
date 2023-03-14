import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';
import '../../../resources/string_constants.dart';
import '../../global_components/custom_textfield.dart';

class LoginTetFields extends StatelessWidget {
  const LoginTetFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        EmailInput(),
        SizedBox(height: 10.0),
        PasswordInput(),
      ],
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      return CustomTextField(
        labelText: 'Email',
        iconData: Icons.email,
        error: state.errors[StringConstants.email.value],
        onChangeFunc: (value) => context.read<LoginCubit>().emailChanged(value),
      );
    });
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return CustomTextField(
          labelText: 'Password',
          obscureText: _isObscure,
          iconData: Icons.remove_red_eye_rounded,
          onIconPressedFunc: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
          error: state.errors[StringConstants.password.value],
          onChangeFunc: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
        );
      },
    );
  }
}
