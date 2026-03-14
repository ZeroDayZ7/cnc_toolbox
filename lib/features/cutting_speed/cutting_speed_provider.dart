import 'package:cnc_toolbox/core/cutting_calculator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cutting_speed_provider.g.dart';

class CuttingSpeedState {
  final double diameter;
  final int rpm;
  final double feedPerTooth;
  final int teethCount;
  final String material;

  CuttingSpeedState({
    this.diameter = 0,
    this.rpm = 0,
    this.feedPerTooth = 0,
    this.teethCount = 1,
    this.material = 'Steel',
  });

  /// Obliczenia przy użyciu klasy CuttingCalculator
  double get cuttingSpeed {
    final result = CuttingCalculator.calculate(
      material: material,
      fz: feedPerTooth,
      z: teethCount,
      n: rpm,
    );
    return result['vc']!;
  }

  double get feedRate {
    final result = CuttingCalculator.calculate(
      material: material,
      fz: feedPerTooth,
      z: teethCount,
      n: rpm,
    );
    return result['f']!;
  }

  double get cuttingSpeedFt => cuttingSpeed * 3.28084;

  String? get safetyAlert {
    if (material == 'Steel' && cuttingSpeed > 250) {
      return 'alert_high_speed_steel';
    }
    if (material == 'Aluminum' && cuttingSpeed > 1000) {
      return 'alert_high_speed_alu';
    }
    if (rpm > 20000) {
      return 'alert_extreme_rpm';
    }
    return null;
  }
}

@riverpod
class CuttingSpeedNotifier extends _$CuttingSpeedNotifier {
  @override
  CuttingSpeedState build() => CuttingSpeedState();

  void updateInputs({double? d, int? n, double? fz, int? z, String? mat}) {
    state = CuttingSpeedState(
      diameter: d ?? state.diameter,
      rpm: n ?? state.rpm,
      feedPerTooth: fz ?? state.feedPerTooth,
      teethCount: z ?? state.teethCount,
      material: mat ?? state.material,
    );
  }
}
