import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/blinds.dart';
import '../enums/game_speed.dart';
import 'base_lobby.dart';

class CashLobby extends BaseLobby {
  CashLobby({
    required super.lobbyId,
    required super.maxPlayers,
    required super.buyIn,
    required super.blinds,
    super.gameSpeed,
  });

  CashLobby.creation({
    required int maxPlayers,
    required double buyIn,
    required Blinds blinds,
    GameSpeed gameSpeed = GameSpeed.normal,
  }) : super.creation(
            maxPlayers: maxPlayers,
            buyIn: buyIn,
            blinds: blinds,
            gameSpeed: gameSpeed);

  static CashLobby fromFirebase(DocumentSnapshot snapshot) {
    return CashLobby(
      lobbyId: snapshot.id,
      maxPlayers: snapshot['maxPlayers'],
      buyIn: snapshot['buyIn'],
      blinds: Blinds.getBlindsByName(snapshot['blinds']),
      gameSpeed: GameSpeed.getBlindsByName(snapshot['gameSpeed']),
    );
  }
}
