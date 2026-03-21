// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GCode _$GCodeFromJson(Map<String, dynamic> json) => _GCode(
  code: json['code'] as String,
  titleKey: json['titleKey'] as String,
  descriptionKey: json['descriptionKey'] as String,
  example: json['example'] as String,
);

Map<String, dynamic> _$GCodeToJson(_GCode instance) => <String, dynamic>{
  'code': instance.code,
  'titleKey': instance.titleKey,
  'descriptionKey': instance.descriptionKey,
  'example': instance.example,
};
