import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/lobbies/lobbies_bloc.dart';
import '../../blocs/single_lobby/single_lobby_bloc.dart';

class TableScreen extends StatelessWidget {
  static const String routeName = '/table';
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LobbiesBloc>().add(CashLobbyCreated());
    return Scaffold(
      body: BlocBuilder<SingleLobbyBloc, SingleLobbyState>(
        builder: (context, state) {
          log('state of table: $state');
          return Container();
        },
      ),
    );
  }
}
