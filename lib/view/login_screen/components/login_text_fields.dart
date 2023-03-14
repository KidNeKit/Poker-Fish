import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/login/login_cubit.dart';
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
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) => CustomTextField(
        labelText: 'Email',
        iconData: Icons.email,
        onChangeFunc: (value) => context.read<LoginCubit>().emailChanged(value),
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  const PasswordInput({super.key});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isObscure = true;

  void changeTextVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => CustomTextField(
        labelText: 'Password',
        obscureText: _isObscure,
        iconData: Icons.remove_red_eye_rounded,
        onIconPressedFunc: changeTextVisibility,
        onChangeFunc: (value) =>
            context.read<LoginCubit>().passwordChanged(value),
      ),
    );
  }
}
