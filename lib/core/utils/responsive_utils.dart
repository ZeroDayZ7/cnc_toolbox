import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:flutter/material.dart';

extension ResponsiveHelper on BuildContext {
  /// Zwraca true, jeśli ekran jest szerszy niż breakpoint Desktop (np. 900px)
  bool get isDesktop => MediaQuery.of(this).size.width > AppBreakpoints.desktop;

  /// Zwraca true, jeśli ekran jest szerszy niż Tablet (np. 600px), ale mniejszy niż Desktop
  bool get isTablet =>
      MediaQuery.of(this).size.width >= AppBreakpoints.tablet &&
      MediaQuery.of(this).size.width <= AppBreakpoints.desktop;

  /// Zwraca true dla wąskich ekranów (poniżej 600px)
  bool get isMobile => MediaQuery.of(this).size.width < AppBreakpoints.tablet;

  /// Szybki dostęp do szerokości ekranu
  double get screenWidth => MediaQuery.of(this).size.width;
}
