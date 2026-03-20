import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand
  static const Color primary = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF1976D2);
  static const Color accent = Color(0xFF64B5F6);

  // Backgrounds
  static const Color bgDark = Color(0xFF121212);
  static const Color bgLight = Color(0xFFF5F5F5);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Statuses (CNC specific)
  static const Color statusReady = Color(0xFF4CAF50);
  static const Color statusWorking = Color(0xFF2196F3);
  static const Color statusWarning = Color(0xFFFFA000);
  static const Color statusError = Color(0xFFD32F2F);
}
