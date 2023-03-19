import '../models/lobbies/cash_lobby.dart';
import 'base_lobby_repository.dart';

class CashLobbyRepository extends BaseLobbyRepository {
  @override
  void closeLobby() {
    // TODO: implement closeLobby
  }

  @override
  Future<CashLobby> createLobby() async {
    CashLobby cashLobby = CashLobby.creation(maxPlayers: 6, buyIn: 2.00);

    await firestore
        .collection(getLobbyCollectionFirestorePath())
        .add(cashLobby.toMap())
        .then((value) => cashLobby.setLobbyId = value.id);

    return cashLobby;
  }

  @override
  String getLobbyCollectionFirestorePath() {
    return 'cashLobbies';
  }
}
