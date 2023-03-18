abstract class BaseLobby {
  final int _maxPlayers;
  final double _buyIn;

  BaseLobby({required int maxPlayers, required double buyIn})
      : _maxPlayers = maxPlayers,
        _buyIn = buyIn;

  int get maxPlayers => _maxPlayers;
  double get buyIn => _buyIn;
}
