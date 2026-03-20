import 'package:flutter/material.dart';

class CncColors extends ThemeExtension<CncColors> {
  final Color? toolStatus;
  final Color? machineActive;

  CncColors({this.toolStatus, this.machineActive});

  @override
  CncColors copyWith({Color? toolStatus, Color? machineActive}) {
    return CncColors(
      toolStatus: toolStatus ?? this.toolStatus,
      machineActive: machineActive ?? this.machineActive,
    );
  }

  @override
  CncColors lerp(ThemeExtension<CncColors>? other, double t) {
    if (other is! CncColors) return this;
    return CncColors(
      toolStatus: Color.lerp(toolStatus, other.toolStatus, t),
      machineActive: Color.lerp(machineActive, other.machineActive, t),
    );
  }
}
