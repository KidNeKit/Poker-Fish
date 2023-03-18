import 'base_lobby.dart';

class CashLobby extends BaseLobby {
  CashLobby({
    required int maxPlayers,
    required double buyIn,
  }) : super(
          maxPlayers: maxPlayers,
          buyIn: buyIn,
        );
}
