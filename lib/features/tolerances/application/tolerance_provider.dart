// lib/features/tolerances/application/tolerance_provider.dart

import 'package:cnc_toolbox/features/tolerances/data/tolerance_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'tolerance_service.dart';

part 'tolerance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ToleranceService> toleranceService(Ref ref) async {
  final repository = ToleranceRepository();
  final data = await repository.loadTolerances();

  return ToleranceService(data);
}
