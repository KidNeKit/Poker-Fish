enum GameSpeed {
  normal,
  turbo,
  superTurbo;

  static GameSpeed getBlindsByName(String name) {
    return GameSpeed.values.firstWhere((element) => element.name == name);
  }
}
