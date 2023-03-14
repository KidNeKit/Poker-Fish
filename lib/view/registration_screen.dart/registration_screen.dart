import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/registration/registration_cubit.dart';
import '../../models/enums/operation_status.dart';
import '../home_screen/home_screen.dart';
import 'components/registration_form.dart';

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
      child: const Scaffold(
        body: RegistrationForm(),
      ),
    );
  }
}
