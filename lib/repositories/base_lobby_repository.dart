import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:poker_fish/models/lobbies/base_lobby.dart';

abstract class BaseLobbyRepository {
  final FirebaseFirestore firestore;

  BaseLobbyRepository({FirebaseFirestore? firebaseFirestore})
      : firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<BaseLobby> createLobby();

  void closeLobby();

  String getLobbyCollectionFirestorePath();
}
