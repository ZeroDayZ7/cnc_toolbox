import 'package:flutter/material.dart';

abstract class AppSpacings {
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
}

abstract class AppRadii {
  static const double s = 4.0;
  static const double m = 8.0;
  static const double l = 16.0;
  static BorderRadius radiusM = BorderRadius.circular(m);
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
