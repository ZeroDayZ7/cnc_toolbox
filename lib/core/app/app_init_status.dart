import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_init_status.freezed.dart';

@freezed
sealed class AppInitStatus with _$AppInitStatus {
  const factory AppInitStatus.loading() = _Loading;

  // Główny stan pracy aplikacji (zamiast authorized/unauthenticated)
  const factory AppInitStatus.ready() = _Ready;

  // Na wypadek, gdyby np. baza danych Drift nie mogła się otworzyć
  const factory AppInitStatus.blocked({String? reason}) = _Blocked;
}
