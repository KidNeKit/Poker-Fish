import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../blocs/lobbies/lobbies_bloc.dart';
import '../../../models/enums/lobby_type.dart';
import '../../../models/enums/operation_status.dart';
import '../../../models/lobbies/cash_lobby.dart';
import '../../global_components/table_tag.dart';
import '../../table_screen/table_screen.dart';

class LobbiesListView extends StatelessWidget {
  const LobbiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: BlocBuilder<LobbiesBloc, LobbiesState>(
          builder: (context, state) {
            if (state.status == OperationStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.cashLobbiesList.isEmpty) {
              return const Text('There are no lobbies');
            }
            return ListView.separated(
              itemCount: state.cashLobbiesList.length,
              itemBuilder: (context, index) {
                CashLobby cashLobby = state.cashLobbiesList[index];
                return LobbyItem(
                  lobbyId: cashLobby.lobbyId,
                  smallBlind: cashLobby.blinds.small,
                  bigBlind: cashLobby.blinds.big,
                  buyIn: cashLobby.buyIn,
                  avgBank: 0.0,
                  maxPlayers: cashLobby.maxPlayers,
                );
              },
              padding: EdgeInsets.zero,
              separatorBuilder: (_, __) => const SizedBox(height: 5.0),
            );
          },
        ),
      ),
    );
  }
}

class LobbyItem extends StatelessWidget {
  final String _lobbyId;
  final double _smallBlind;
  final double _bigBlind;
  final double _buyIn;
  final double _avgBank;
  final int _maxPlayers;

  const LobbyItem(
      {required String lobbyId,
      required double smallBlind,
      required double bigBlind,
      required double buyIn,
      required double avgBank,
      required int maxPlayers,
      super.key})
      : _lobbyId = lobbyId,
        _smallBlind = smallBlind,
        _bigBlind = bigBlind,
        _buyIn = buyIn,
        _avgBank = avgBank,
        _maxPlayers = maxPlayers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(TableScreen.routeName,
            arguments: {'lobbyType': LobbyType.cash, 'lobbyId': _lobbyId});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blue[600]!,
            ),
            BoxShadow(
              color: Theme.of(context).primaryColor,
              spreadRadius: -5.0,
              blurRadius: 8.0,
            ),
          ],
        ),
        child: BlocBuilder<LobbiesBloc, LobbiesState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (ctx, constraints) {
                var itemWidth = constraints.maxWidth;
                var playersCircle = 1 / 4 * itemWidth;
                var infoWidth = itemWidth - playersCircle;
                return Row(
                  children: [
                    SizedBox(
                      height: playersCircle,
                      width: playersCircle,
                      child: Center(
                        child: CircularPercentIndicator(
                          radius: playersCircle / 2.5,
                          backgroundColor: Colors.black,
                          progressColor: Colors.blue,
                          percent: 0.5,
                          center: Text(
                            '1 / $_maxPlayers',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: infoWidth,
                      padding: const EdgeInsets.all(10.0).copyWith(left: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_lobbyId,
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 5.0),
                          Row(
                            children: const [
                              TableTag(
                                tag: 'Tag 1',
                                backgroundColor: Colors.yellow,
                              ),
                              TableTag(
                                tag: 'Tag 2',
                                backgroundColor: Colors.yellow,
                              ),
                              TableTag(
                                tag: 'Tag 3',
                                backgroundColor: Colors.yellow,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LabelAndValueCol(
                                label: 'Blinds',
                                value: '$_smallBlind/$_bigBlind\$',
                              ),
                              LabelAndValueCol(
                                label: 'Buy-in',
                                value: '$_buyIn\$',
                              ),
                              LabelAndValueCol(
                                label: 'Avg Bank',
                                value: '$_avgBank\$',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class LabelAndValueCol extends StatelessWidget {
  final String _label;
  final String _value;
  const LabelAndValueCol(
      {required String label, required String value, super.key})
      : _label = label,
        _value = value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_label,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.grey)),
        const SizedBox(height: 5.0),
        Text(_value, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
