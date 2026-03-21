// lib/features/tolerances/data/tolerance_repository.dart

import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:flutter/services.dart';

import '../domain/tolerance_models.dart';

class ToleranceRepository {
  Future<Map<ToleranceType, Map<String, List<ToleranceRange>>>>
  loadTolerances() async {
    final jsonString = await rootBundle.loadString(AppAssets.tolerancesJson);
    final Map<String, dynamic> decoded = json.decode(jsonString);

    return {
      ToleranceType.hole: _parseSection(
        decoded['holes'] as Map<String, dynamic>?,
      ),
      ToleranceType.shaft: _parseSection(
        decoded['shafts'] as Map<String, dynamic>?,
      ),
    };
  }

  Map<String, List<ToleranceRange>> _parseSection(
    Map<String, dynamic>? section,
  ) {
    if (section == null) return {};

    return section.map((grade, ranges) {
      final list = (ranges as List?) ?? [];
      return MapEntry(
        grade,
        list
            .map((e) => ToleranceRange.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    });
  }
}
