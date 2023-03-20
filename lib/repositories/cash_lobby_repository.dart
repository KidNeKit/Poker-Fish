import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lobbies/base_lobby.dart';
import '../models/lobbies/cash_lobby.dart';
import 'base_lobby_repository.dart';

class CashLobbyRepository extends BaseLobbyRepository {
  @override
  Future<List<CashLobby>> getAllLobbies() async {
    QuerySnapshot query =
        await firestore.collection(getLobbyCollectionFirestorePath()).get();
    return query.docs.map((snap) => CashLobby.fromFirebase(snap)).toList();
  }

  @override
  void closeLobby() {
    // TODO: implement closeLobby
  }

  @override
  Future<CashLobby> createLobby(BaseLobby baseLobby) async {
    await firestore
        .collection(getLobbyCollectionFirestorePath())
        .add(baseLobby.toMap())
        .then((value) => baseLobby.setLobbyId = value.id);

    return baseLobby as CashLobby;
  }

  @override
  String getLobbyCollectionFirestorePath() {
    return 'cashLobbies';
  }
}
