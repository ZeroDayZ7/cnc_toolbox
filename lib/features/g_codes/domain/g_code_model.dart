import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_code_model.freezed.dart';
part 'g_code_model.g.dart';

// 1. Model pojedynczego kodu (zostawiamy tak jak miałeś)
@freezed
sealed class GCode with _$GCode {
  const factory GCode({
    required String code,
    required String titleKey,
    required String descriptionKey,
    required String example,
  }) = _GCode;

  factory GCode.fromJson(Map<String, dynamic> json) => _$GCodeFromJson(json);
}

// 2. Model stanu całej strony
@freezed
sealed class GCodeState with _$GCodeState {
  const factory GCodeState({
    @Default('') String searchQuery,
    @Default([]) List<GCode> allCodes,
    @Default([]) List<GCode> filteredCodes,
    @Default(true) bool isLoading,
  }) = _GCodeState;
}