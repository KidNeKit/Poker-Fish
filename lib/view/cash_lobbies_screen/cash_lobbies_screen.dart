import 'package:flutter/material.dart';
import 'package:poker_fish/resources/colors.dart';

import 'components/game_filter.dart';
import 'components/lobbies_listview.dart';

class CashLobbyScreen extends StatelessWidget {
  const CashLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greyColor,
      child: Column(
        children: const [
          //GameFilter(),
          //SizedBox(height: 10.0),
          LobbiesListView(),
        ],
      ),
    );
  }
}
