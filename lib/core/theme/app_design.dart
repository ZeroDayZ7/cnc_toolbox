import 'package:flutter/material.dart';

abstract class AppSpacings {
  // Bazowe wartości
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;

  // Gotowe Paddingi (EdgeInsets) - najczęstsze przypadki
  static const EdgeInsets edgeInsetsXs = EdgeInsets.all(xs);
  static const EdgeInsets edgeInsetsS = EdgeInsets.all(s);
  static const EdgeInsets edgeInsetsM = EdgeInsets.all(m);
  static const EdgeInsets edgeInsetsL = EdgeInsets.all(l);

  // Symetryczne (często używane w listach i formularzach)
  static const EdgeInsets hvM = EdgeInsets.symmetric(
    horizontal: m,
    vertical: m,
  );
  static const EdgeInsets hM = EdgeInsets.symmetric(horizontal: m);
  static const EdgeInsets vM = EdgeInsets.symmetric(vertical: m);

  // Gotowe odstępy (SizedBox) - zamiast pisać AppSpacings.edgeInsetsM
  static const gapXs = SizedBox(width: xs, height: xs);
  static const gapS = SizedBox(width: s, height: s);
  static const gapM = SizedBox(width: m, height: m);
  static const gapL = SizedBox(width: l, height: l);
}

abstract class AppRadii {
  static const double s = 4.0;
  static const double m = 8.0;
  static const double l = 16.0;

  // BorderRadius jako gotowe obiekty
  static final BorderRadius radiusS = BorderRadius.circular(s);
  static final BorderRadius radiusM = BorderRadius.circular(m);
  static final BorderRadius radiusL = BorderRadius.circular(l);
}

enum ContainerSize {
  compact(320.0),
  narrow(420.0),
  form(550.0),
  medium(750.0),
  reading(900.0),
  wide(1150.0),
  full(double.infinity);

  final double maxWidth;
  const ContainerSize(this.maxWidth);
}
