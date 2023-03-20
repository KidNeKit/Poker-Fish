import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/navigation/navigation_cubit.dart';

class NavBar extends StatelessWidget {
  final List<IconData> _icons = const [
    Icons.home,
    Icons.home,
    Icons.man,
  ];

  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.07 * MediaQuery.of(context).size.height,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          _icons.length,
          (index) => GestureDetector(
            onTap: () => context.read<NavigationCubit>().changeScreen(index),
            child: Icon(
              _icons[index],
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
