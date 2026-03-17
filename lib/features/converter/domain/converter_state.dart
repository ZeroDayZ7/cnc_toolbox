// features/converter/domain/converter_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'converter_state.freezed.dart';

@freezed
sealed class ConverterState with _$ConverterState {
  const factory ConverterState({
    @Default({})
    Map<String, String> values,
    @Default([])
    List<String> favoriteUnits,
  }) = _ConverterState;
}
