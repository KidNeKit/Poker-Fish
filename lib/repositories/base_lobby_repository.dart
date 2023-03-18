import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseLobbyRepository {
  final FirebaseFirestore _firestore;
  BaseLobbyRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  void createLobby();

  void closeLobby();
}
