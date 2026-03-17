// lib/features/converter/data/units_repository.dart
import 'package:cnc_toolbox/features/converter/data/units_repository.dart';
import 'package:cnc_toolbox/features/converter/models/converter_category.dart';
import 'package:flutter/material.dart';

final List<ConverterCategory> converterCategories = [
  ConverterCategory(
    id: 'length',
    icon: Icons.straighten,
    label: 'Długość',
    units: lengthUnits,
  ),
  ConverterCategory(
    id: 'temp',
    icon: Icons.thermostat,
    label: 'Temperatura',
    units: tempUnits,
  ),
  ConverterCategory(
    id: 'speed',
    icon: Icons.speed,
    label: 'Prędkość',
    units: [],
  ),
  ConverterCategory(
    id: 'pressure',
    icon: Icons.compress,
    label: 'Ciśnienie',
    units: [],
  ),
];