import 'package:flutter/material.dart';

abstract interface class AppToolRoute {
  IconData get icon;
  String get labelKey;
  String get descriptionKey;
  String get path;
  void navigateTo(BuildContext context);
  bool isActive(String location);
}
