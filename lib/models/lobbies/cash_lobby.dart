import 'base_lobby.dart';

class CashLobby extends BaseLobby {
  CashLobby({
    required super.lobbyId,
    required super.maxPlayers,
    required super.buyIn,
  });

  CashLobby.creation({
    required int maxPlayers,
    required double buyIn,
  }) : super.creation(maxPlayers: maxPlayers, buyIn: buyIn);
}
