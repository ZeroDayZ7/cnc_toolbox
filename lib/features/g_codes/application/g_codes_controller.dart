import 'package:easy_localization/easy_localization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/g_codes_repository.dart';
import '../domain/g_code_model.dart';

part 'g_codes_controller.g.dart';

@Riverpod(keepAlive: true)
class GCodeController extends _$GCodeController {
  @override
  GCodeState build() {
    _loadInitialData();
    return const GCodeState(isLoading: true);
  }

  Future<void> _loadInitialData() async {
    final repo = ref.read(gCodesRepositoryProvider);
    final codes = await repo.loadGCodes();

    state = state.copyWith(
      allCodes: codes,
      filteredCodes: codes,
      isLoading: false,
    );
  }

  void updateSearch(String query) {
    final lowercaseQuery = query.toLowerCase();

    final filtered = state.allCodes.where((code) {
      if (query.isEmpty) return true;

      return code.code.toLowerCase().contains(lowercaseQuery) ||
          code.titleKey.tr().toLowerCase().contains(lowercaseQuery) ||
          code.descriptionKey.tr().toLowerCase().contains(lowercaseQuery);
    }).toList();

    state = state.copyWith(searchQuery: query, filteredCodes: filtered);
  }
}
