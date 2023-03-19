import 'package:poker_fish/models/enums/blinds.dart';

import 'base_lobby.dart';

class CashLobby extends BaseLobby {
  CashLobby({
    required super.lobbyId,
    required super.maxPlayers,
    required super.buyIn,
    required super.blinds,
  });

  CashLobby.creation({
    required int maxPlayers,
    required double buyIn,
    required Blinds blinds,
  }) : super.creation(maxPlayers: maxPlayers, buyIn: buyIn, blinds: blinds);
}
