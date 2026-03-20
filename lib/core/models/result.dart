import 'package:flutter/foundation.dart';

/// Generyczna klasa do obsługi wyników operacji.
/// Zapobiega rzucaniu wyjątkami (Exceptions) i wymusza obsługę błędów w UI.
@immutable
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final Object error;
  final StackTrace? stackTrace;
  const Failure(this.error, [this.stackTrace]);
}
