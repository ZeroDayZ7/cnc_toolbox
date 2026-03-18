import 'package:freezed_annotation/freezed_annotation.dart';

part 'tolerance_models.freezed.dart';
part 'tolerance_models.g.dart';

enum ToleranceType { hole, shaft }

@freezed
sealed class ToleranceRange with _$ToleranceRange {
  const factory ToleranceRange({
    @Default(0.0) double min,
    @Default(0.0) double max,
    double? upper,
    double? lower,
    @JsonKey(name: 'restriction_key') String? restrictionKey,
    @JsonKey(name: 'info_key') String? infoKey,
  }) = _ToleranceRange;

  factory ToleranceRange.fromJson(Map<String, dynamic> json) =>
      _$ToleranceRangeFromJson(json);
}

@freezed
sealed class ToleranceResult with _$ToleranceResult {
  const factory ToleranceResult({
    double? upperDeviation,
    double? lowerDeviation,
    double? minSize,
    double? maxSize,
    String? restrictionKey,
    String? infoKey,
  }) = _ToleranceResult;
}
