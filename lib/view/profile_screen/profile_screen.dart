import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'components/profile_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<AuthBloc>().add(AuthLogOutRequested());
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        log(state.toString());
        return Column(
          children: const [
            ProfileHeader(),
          ],
        );
      },
    );
  }
}
