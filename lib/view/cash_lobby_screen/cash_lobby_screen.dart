import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/lobby/lobby_bloc.dart';
import '../../repositories/cash_lobby_repository.dart';
import 'components/game_filter.dart';
import 'components/lobbies_listview.dart';

class CashLobbyScreen extends StatelessWidget {
  const CashLobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LobbyBloc(lobbyRepository: context.read<CashLobbyRepository>())
            ..add(CashLobbiesRequested()),
      child: Column(
        children: const [
          GameFilter(),
          SizedBox(height: 10.0),
          LobbiesListView(),
        ],
      ),
    );
  }
}
