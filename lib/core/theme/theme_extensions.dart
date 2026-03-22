import 'package:flutter/material.dart';

/// A custom theme extension for CNC-specific semantic colors.
///
/// This class extends [ThemeExtension] to provide domain-specific colors
/// (like tool statuses or machine activity) that are not part of the
/// standard Flutter [ColorScheme].
class CncColors extends ThemeExtension<CncColors> {
  /// Color representing the current state of a CNC tool (e.g., active, warning, idle).
  final Color? toolStatus;

  /// Color used to indicate active machine operations in the UI.
  final Color? machineActive;

  CncColors({this.toolStatus, this.machineActive});

  @override
  /// Creates a copy of this [CncColors] with the given fields replaced by new values.
  CncColors copyWith({Color? toolStatus, Color? machineActive}) {
    return CncColors(
      toolStatus: toolStatus ?? this.toolStatus,
      machineActive: machineActive ?? this.machineActive,
    );
  }

  @override
  /// Linearly interpolates between two [CncColors] objects.
  ///
  /// This ensures smooth color transitions when switching between
  /// Light and Dark modes.
  CncColors lerp(ThemeExtension<CncColors>? other, double t) {
    if (other is! CncColors) return this;
    return CncColors(
      toolStatus: Color.lerp(toolStatus, other.toolStatus, t),
      machineActive: Color.lerp(machineActive, other.machineActive, t),
    );
  }
}

/// Convenient access to [CncColors] via [BuildContext].
///
/// Instead of writing: `Theme.of(context).extension<CncColors>()!`
/// You can now simply write: `context.cncColors`
extension CncThemeX on BuildContext {
  CncColors get cncColors => Theme.of(this).extension<CncColors>()!;
}
