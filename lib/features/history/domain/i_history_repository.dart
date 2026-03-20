import 'package:cnc_toolbox/core/database/database.dart';
import 'package:cnc_toolbox/core/models/result.dart';

abstract class IHistoryRepository {
  /// Pobiera historię. Zwraca Success z listą lub Failure z opisem błędu.
  Future<Result<List<FeedCalculation>>> getFeedHistory();

  /// Dodaje wpis. Zwraca Success(true) lub Failure.
  Future<Result<bool>> addToHistory(FeedCalculationsCompanion entry);
}
