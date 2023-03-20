import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/lobbies/base_lobby.dart';

abstract class BaseLobbyRepository {
  final FirebaseFirestore firestore;

  BaseLobbyRepository({FirebaseFirestore? firebaseFirestore})
      : firestore = firebaseFirestore ?? FirebaseFirestore.instance;
  Future<List<BaseLobby>> getAllLobbies();

  Future<BaseLobby> createLobby(BaseLobby baseLobby);

  void closeLobby();

  String getLobbyCollectionFirestorePath();
}
