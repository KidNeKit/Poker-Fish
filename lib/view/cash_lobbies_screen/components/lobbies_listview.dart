import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../blocs/lobbies/lobbies_bloc.dart';
import '../../../models/enums/lobby_type.dart';
import '../../../models/enums/operation_status.dart';
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
              //} else if (state.cashLobbiesList.isEmpty) {
              //  return const Text('There are no lobbies');
            }
            return ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) => const LobbyItem(),
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
  const LobbyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(TableScreen.routeName,
            arguments: {'lobbyType': LobbyType.cash, 'lobbyId': 'asdasdasd'});
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
              spreadRadius: -3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: LayoutBuilder(
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
                      radius: playersCircle / 3,
                      backgroundColor: Colors.black,
                      progressColor: Colors.blue,
                      percent: 0.5,
                      center: const Text(
                        '1 / 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: infoWidth,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Table title'),
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
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text('Blinds'),
                              Text('0.02/0.05\$'),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('Buy-in'),
                              Text('2.00\$'),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('Avg Bank'),
                              Text('0.54\$'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
