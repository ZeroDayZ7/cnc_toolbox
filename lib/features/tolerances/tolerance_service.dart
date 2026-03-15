

class ToleranceRange {
  final double minDiameter;
  final double maxDiameter;
  final Map<String, List<double>> grades;

  const ToleranceRange({
    required this.minDiameter,
    required this.maxDiameter,
    required this.grades,
  });
}

class ToleranceService {
  static final List<ToleranceRange> _data = [
    ToleranceRange(
      minDiameter: 0.0,
      maxDiameter: 3.0,
      grades: {
        'h6': [0.0, -0.006],
        'h7': [0.0, -0.010],
        'H6': [0.006, 0.0],
        'H7': [0.010, 0.0],
        'g6': [-0.002, -0.008],
        'JS7': [0.005, -0.005],
      },
    ),
    ToleranceRange(
      minDiameter: 3.0,
      maxDiameter: 6.0,
      grades: {
        'h6': [0.0, -0.008],
        'h7': [0.0, -0.012],
        'H6': [0.008, 0.0],
        'H7': [0.012, 0.0],
        'g6': [-0.004, -0.012],
        'JS7': [0.006, -0.006],
      },
    ),
    ToleranceRange(
      minDiameter: 6.0,
      maxDiameter: 10.0,
      grades: {
        'h6': [0.0, -0.009],
        'h7': [0.0, -0.015],
        'H6': [0.009, 0.0],
        'H7': [0.015, 0.0],
        'g6': [-0.005, -0.014],
        'JS7': [0.007, -0.007],
      },
    ),
    ToleranceRange(
      minDiameter: 10.0,
      maxDiameter: 18.0,
      grades: {
        'h6': [0.0, -0.011],
        'h7': [0.0, -0.018],
        'H6': [0.011, 0.0],
        'H7': [0.018, 0.0],
        'g6': [-0.006, -0.017],
        'JS7': [0.009, -0.009],
      },
    ),
    ToleranceRange(
      minDiameter: 18.0,
      maxDiameter: 30.0,
      grades: {
        'h6': [0.0, -0.013],
        'h7': [0.0, -0.021],
        'H6': [0.013, 0.0],
        'H7': [0.021, 0.0],
        'g6': [-0.007, -0.020],
        'JS7': [0.010, -0.010],
      },
    ),
    ToleranceRange(
      minDiameter: 30.0,
      maxDiameter: 50.0,
      grades: {
        'h6': [0.0, -0.016],
        'h7': [0.0, -0.025],
        'H6': [0.016, 0.0],
        'H7': [0.025, 0.0],
        'g6': [-0.009, -0.025],
        'JS7': [0.012, -0.012],
      },
    ),
    ToleranceRange(
      minDiameter: 50.0,
      maxDiameter: 80.0,
      grades: {
        'h6': [0.0, -0.019],
        'h7': [0.0, -0.030],
        'H6': [0.019, 0.0],
        'H7': [0.030, 0.0],
        'g6': [-0.010, -0.029],
        'JS7': [0.015, -0.015],
      },
    ),
  ];

  static List<String> getAvailableGrades() {
    return ['h6', 'h7', 'H6', 'H7', 'g6', 'JS7'];
  }

  static Map<String, double>? calculate(double diameter, String grade) {
    try {
      final range = _data.firstWhere(
        (r) => diameter > r.minDiameter && diameter <= r.maxDiameter,
      );
      final dev = range.grades[grade];
      if (dev == null) return null;
      return {
        'upper': dev[0],
        'lower': dev[1],
        'max': diameter + dev[0],
        'min': diameter + dev[1],
      };
    } catch (e) {
      return null;
    }
  }
}
