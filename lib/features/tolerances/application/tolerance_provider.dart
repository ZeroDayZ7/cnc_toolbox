import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/tolerance_models.dart';
import 'tolerance_service.dart';

part 'tolerance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ToleranceService> toleranceService(Ref ref) async {
  final jsonString = await rootBundle.loadString(AppAssets.tolerancesJson);
  final Map<String, dynamic> decoded = json.decode(jsonString);

  Map<String, List<ToleranceRange>> parse(Map<String, dynamic>? section) {
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

  final data = {
    ToleranceType.hole: parse(decoded['holes'] as Map<String, dynamic>?),
    ToleranceType.shaft: parse(decoded['shafts'] as Map<String, dynamic>?),
  };

  return ToleranceService(data);
}
