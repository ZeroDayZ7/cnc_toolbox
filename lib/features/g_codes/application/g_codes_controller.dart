import 'dart:async';

import 'package:cnc_toolbox/core/constants/constants.dart';
import 'package:cnc_toolbox/core/models/result.dart';
import 'package:cnc_toolbox/core/utils/logger/logger_provider.dart';
import 'package:cnc_toolbox/features/g_codes/data/g_codes_repository.dart';
import 'package:cnc_toolbox/features/g_codes/domain/g_code_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'g_codes_controller.g.dart';

@Riverpod(keepAlive: true)
class GCodeController extends _$GCodeController {
  Timer? _debounce;
  @override
  GCodeState build() {
    ref.onDispose(() => _debounce?.cancel());
    _loadInitialData();
    return const GCodeState(isLoading: true);
  }

  Future<void> _loadInitialData() async {
    final repo = ref.read(gCodesRepositoryProvider);
    final result = await repo.loadGCodes();

    state = switch (result) {
      Success(data: final codes) => state.copyWith(
        allCodes: codes,
        filteredCodes: codes,
        isLoading: false,
      ),
      Failure(error: final e) => _handleFailure(e),
    };
  }

  GCodeState _handleFailure(Object e) {
    ref.read(appLoggerProvider).e('Failed to load G-Codes', error: e);
    return state.copyWith(isLoading: false);
  }

  void updateSearch(String query) {
    _debounce?.cancel();

    _debounce = Timer(AppConfig.searchDebounce, () {
      final lowercaseQuery = query.toLowerCase();

      final filtered = state.allCodes.where((code) {
        if (query.isEmpty) return true;

        return code.code.toLowerCase().contains(lowercaseQuery) ||
            code.titleKey.tr().toLowerCase().contains(lowercaseQuery) ||
            code.descriptionKey.tr().toLowerCase().contains(lowercaseQuery);
      }).toList();

      state = state.copyWith(searchQuery: query, filteredCodes: filtered);
    });
  }
}
