class FeedHistoryItem {
  final double vf;
  final double n;
  final double fz;
  final int z;
  final double toolDiameter;
  final double? featureDiameter;
  final DateTime createdAt;

  FeedHistoryItem({
    required this.vf,
    required this.n,
    required this.fz,
    required this.z,
    required this.toolDiameter,
    this.featureDiameter,
    required this.createdAt,
  });
}