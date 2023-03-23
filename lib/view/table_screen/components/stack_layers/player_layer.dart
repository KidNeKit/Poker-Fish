import 'package:flutter/material.dart';

import '../table_player.dart';

class PlayerLayer extends StatelessWidget {
  const PlayerLayer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 0.3 * screenHeight,
      child: const TablePlayer(),
    );
  }
}
