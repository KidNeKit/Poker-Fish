enum Blinds {
  twoCents(0.02, 0.05),
  fiveCents(0.05, 0.1),
  tenCents(0.1, 0.25),
  twentyFiveCents(0.25, 0.5),
  fiftyCents(0.5, 1.0);

  final double small;
  final double big;

  const Blinds(this.small, this.big);
}
