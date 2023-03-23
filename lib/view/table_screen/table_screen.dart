import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/single_lobby/single_lobby_bloc.dart';
import 'table_player.dart';
import 'table_with_players.dart';
import 'turn_buttons.dart';

class TableScreen extends StatefulWidget {
  static const String routeName = '/table';

  final String _lobbyId;
  final String _userId;
  const TableScreen(
      {required String lobbyId, required String userId, super.key})
      : _lobbyId = lobbyId,
        _userId = userId;

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late SingleLobbyBloc _lobbyBloc;
  late String _lobbyId;
  late String _userId;

  @override
  void initState() {
    _lobbyBloc = context.read<SingleLobbyBloc>();
    _lobbyId = widget._lobbyId;
    _userId = widget._userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //context.read<LobbiesBloc>().add(CashLobbyCreated());
    return Scaffold(
      body: Column(
        children: const [
          //TableWithPlayers(),
          TablePlayer(),
          //TurnButtons(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _lobbyBloc.add(LobbyExited(lobbyId: _lobbyId, playerId: _userId));
    super.dispose();
  }
}
