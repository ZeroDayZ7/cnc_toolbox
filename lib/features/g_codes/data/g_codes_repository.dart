import 'dart:convert';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'g_codes_repository.g.dart';

class GCodesRepository {
  Future<Result<List<GCode>>> loadGCodes() async {
    try {
      final String response = await rootBundle.loadString(AppAssets.gCodesJson);
      final List<dynamic> data = json.decode(response);

      final codes = data
          .map((json) => GCode.fromJson(json as Map<String, dynamic>))
          .toList();

      return Success(codes);
    } catch (e, st) {
      return Failure(e, st);
    }
  }
}

@Riverpod(keepAlive: true)
GCodesRepository gCodesRepository(Ref ref) => GCodesRepository();
