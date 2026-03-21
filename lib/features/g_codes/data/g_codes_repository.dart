import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'g_codes_repository.g.dart';

class GCodesRepository {
  Future<List<GCode>> loadGCodes() async {
    final String response = await rootBundle.loadString(AppAssets.gCodesJson);

    final List<dynamic> data = json.decode(response);

    return data
        .map((json) => GCode.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}

@Riverpod(keepAlive: true)
GCodesRepository gCodesRepository(Ref ref) => GCodesRepository();
