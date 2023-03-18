import 'package:flutter/material.dart';

class GameFilter extends StatelessWidget {
  const GameFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.2 * MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
      ),
    );
  }
}
