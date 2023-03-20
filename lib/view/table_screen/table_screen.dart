import 'package:flutter/material.dart';
import 'package:poker_fish/view/table_screen/table_player.dart';

import 'table_with_players.dart';
import 'turn_buttons.dart';

class TableScreen extends StatelessWidget {
  static const String routeName = '/table';
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<LobbiesBloc>().add(CashLobbyCreated());
    return Scaffold(
      body: Column(
        children: const [
          TableWithPlayers(),
          TablePlayer(),
          TurnButtons(),
        ],
      ),
    );
  }
}
