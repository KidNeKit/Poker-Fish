enum Blinds {
  twoCents(0.02, 0.05),
  fiveCents(0.05, 0.1),
  tenCents(0.1, 0.25),
  twentyFiveCents(0.25, 0.5),
  fiftyCents(0.5, 1.0);

  final double _small;
  final double _big;

  const Blinds(this._small, this._big);

  double get small => _small;
  double get big => _big;

  static Blinds getBlindsByName(String name) {
    return Blinds.values.firstWhere((element) => element.name == name);
  }
}
