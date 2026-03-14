// lib/core/cutting_calculator.dart

class CuttingCalculator {
  static Map<String, double> calculate({
    required String material,
    required double fz,
    required int z,
    required int n,
  }) {
    double vc;
    double f;

    switch (material) {
      case 'Steel':
        vc = 120;
        f = fz * z * n;
        break;
      case 'Aluminum':
        vc = 250;
        f = fz * z * n;
        break;
      case 'Stainless':
        vc = 80;
        f = fz * z * n;
        break;
      case 'Titanium':
        vc = 60;
        f = fz * z * n;
        break;
      default:
        vc = 100;
        f = fz * z * n;
    }

    return {'vc': vc, 'f': f};
  }
}
