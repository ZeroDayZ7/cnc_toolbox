import 'package:cnc_toolbox/core/localization/locale_keys.g.dart';
import 'package:cnc_toolbox/core/router/app_router.dart';
import 'package:flutter/material.dart';

import './tool_item.dart';

final tools = [
  const ToolItem(
    icon: Icons.speed,
    labelKey: LocaleKeys.tools_cutting_speed,
    descriptionKey: LocaleKeys.descriptions_cutting_speed,
    route: CuttingSpeedRoute(),
  ),
  const ToolItem(
    icon: Icons.settings,
    labelKey: LocaleKeys.tools_spindle_rpm,
    descriptionKey: LocaleKeys.descriptions_spindle_rpm,
    route: SpindleSpeedRoute(),
  ),
  const ToolItem(
    icon: Icons.calculate,
    labelKey: LocaleKeys.tools_feed_rate,
    descriptionKey: LocaleKeys.descriptions_feed_rate,
    route: FeedRateRoute(),
  ),
  const ToolItem(
    icon: Icons.straighten,
    labelKey: LocaleKeys.tools_unit_converter,
    descriptionKey: LocaleKeys.descriptions_unit_converter,
    route: ConverterRoute(),
  ),
  const ToolItem(
    icon: Icons.precision_manufacturing,
    labelKey: LocaleKeys.tools_tolerances,
    descriptionKey: LocaleKeys.descriptions_tolerances,
    route: TolerancesRoute(),
  ),
  const ToolItem(
    icon: Icons.architecture,
    labelKey: LocaleKeys.tools_gd_symbols,
    descriptionKey: LocaleKeys.descriptions_gd_symbols,
    route: GdSymbolsRoute(),
  ),
  const ToolItem(
    icon: Icons.code,
    labelKey: LocaleKeys.tools_g_codes,
    descriptionKey: LocaleKeys.descriptions_g_codes,
    route: GCodesRoute(),
  ),
];
