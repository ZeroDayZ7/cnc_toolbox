import 'package:cnc_toolbox/core/models/result.dart';

/// Interfejs dla repozytorium bazy danych. F
abstract class IDatabaseRepository {
  Future<Result<bool>> healthCheck();

  Future<void> close();
}
