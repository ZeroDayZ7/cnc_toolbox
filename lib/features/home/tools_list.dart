import 'package:flutter/material.dart';

import './tool_item.dart';

const tools = [
  ToolItem(
    icon: Icons.speed,
    labelKey: "tools.cutting_speed",
    descriptionKey: "descriptions.cutting_speed",
    route: "/cutting-speed",
  ),
  ToolItem(
    icon: Icons.settings,
    labelKey: "tools.spindle_rpm",
    descriptionKey: "descriptions.spindle_rpm",
    route: "/spindle-speed",
  ),
  ToolItem(
    icon: Icons.calculate,
    labelKey: "tools.feed_rate",
    descriptionKey: "descriptions.feed_rate",
    route: "/feed-rate",
  ),
  ToolItem(
    icon: Icons.straighten,
    labelKey: "tools.unit_converter",
    descriptionKey: "descriptions.unit_converter",
    route: "/converter",
  ),
];
