import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/auth/auth_bloc.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 15.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ProfileAvatar(),
            SizedBox(width: 20.0),
            ProfileName(),
          ],
        ),
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    double avatarRadius = 0.05 * MediaQuery.of(context).size.height;
    double changeRadius = 0.3 * avatarRadius;
    return Stack(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CircleAvatar(
            radius: changeRadius,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              size: changeRadius,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.user.username,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Current balance: 0.00\$',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}
