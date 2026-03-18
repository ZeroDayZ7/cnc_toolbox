// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tolerance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToleranceRange _$ToleranceRangeFromJson(Map<String, dynamic> json) =>
    _ToleranceRange(
      min: (json['min'] as num?)?.toDouble() ?? 0.0,
      max: (json['max'] as num?)?.toDouble() ?? 0.0,
      upper: (json['upper'] as num?)?.toDouble(),
      lower: (json['lower'] as num?)?.toDouble(),
      restrictionKey: json['restriction_key'] as String?,
      infoKey: json['info_key'] as String?,
    );

Map<String, dynamic> _$ToleranceRangeToJson(_ToleranceRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'upper': instance.upper,
      'lower': instance.lower,
      'restriction_key': instance.restrictionKey,
      'info_key': instance.infoKey,
    };
