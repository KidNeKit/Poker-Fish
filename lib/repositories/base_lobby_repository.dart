import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lobbies/base_lobby.dart';

abstract class BaseLobbyRepository {
  final FirebaseFirestore firestore;

  BaseLobbyRepository({FirebaseFirestore? firebaseFirestore})
      : firestore = firebaseFirestore ?? FirebaseFirestore.instance;
  Future<List<BaseLobby>> getAllLobbies();

  Future<BaseLobby> createLobby(BaseLobby baseLobby);

  void closeLobby();

  Future<void> joinPlayerToLobby(String lobbyId, String playerId) async {
    firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .doc(playerId)
        .set({'name': 'test'});
  }

  Future<void> removePlayerFromLobby(String lobbyId, String playerId) async {
    firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .doc(playerId)
        .delete();
  }

  String getLobbyCollectionFirestorePath();
}
