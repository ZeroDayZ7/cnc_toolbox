// lib/features/converter/data/units_repository.dart
import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/features/converter/data/units_repository.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:flutter/material.dart';

final List<ConverterCategory> converterCategories = [
  ConverterCategory(
    id: 'length',
    icon: Icons.straighten,
    label: LocaleKeys.converter_categories_length,
    units: lengthUnits,
  ),
  ConverterCategory(
    id: 'temp',
    icon: Icons.thermostat,
    label: LocaleKeys.converter_categories_temp,
    units: tempUnits,
  ),
  ConverterCategory(
    id: 'speed',
    icon: Icons.speed,
    label: LocaleKeys.converter_categories_speed,
    units: speedUnits,
  ),
  ConverterCategory(
    id: 'pressure',
    icon: Icons.compress,
    label: LocaleKeys.converter_categories_pressure,
    units: pressureUnits,
  ),
];
