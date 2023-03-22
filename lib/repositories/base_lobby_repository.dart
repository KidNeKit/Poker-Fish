import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lobbies/base_lobby.dart';
import '../models/player.dart';

abstract class BaseLobbyRepository {
  final FirebaseFirestore firestore;

  BaseLobbyRepository({FirebaseFirestore? firebaseFirestore})
      : firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Player>> getPlayersChangesStream(String lobbyId) {
    return firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .orderBy('order')
        .snapshots()
        .map((players) => players.docs
            .map((doc) => Player.fromMap(doc.data(), doc.id))
            .toList());
  }

  Future<List<Player>> getPlayersByLobbyId(String lobbyId) async {
    var playersSnapshot = await firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .orderBy('order')
        .get();
    return playersSnapshot.docs
        .map((player) => Player.fromMap(player.data(), player.id))
        .toList();
  }

  Future<int> getAvailablePlaceNumberByLobbyId(String lobbyId) async {
    var playersSnapshot = await firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .orderBy('order')
        .get();
    List<int> tookPlaces = playersSnapshot.docs
        .map((player) => player.data()['order'] as int)
        .toList();
    var lobbySnapshot = await firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .get();
    return 1;
  }

  Future<List<BaseLobby>> getAllLobbies();

  Future<BaseLobby> createLobby(BaseLobby baseLobby);

  void closeLobby();

  Future<void> joinPlayerToLobby(String lobbyId, Player player) async {
    firestore
        .collection(getLobbyCollectionFirestorePath())
        .doc(lobbyId)
        .collection('players')
        .doc(player.id)
        .set(player.toMap());
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
