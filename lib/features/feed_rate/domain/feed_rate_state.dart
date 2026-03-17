import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_rate_state.freezed.dart';

@freezed
sealed class FeedRateState with _$FeedRateState {
  const factory FeedRateState({
    // Wejścia podstawowe
    @Default(0.0) double spindleSpeed,
    @Default(0.0) double feedPerTooth,
    @Default(1) int numberOfTeeth,
    
    // Obliczanie n z Vc
    @Default(0.0) double cuttingSpeed, // Vc
    @Default(0.0) double toolDiameter,  // D
    
    // Kompensacja łuku
    @Default(0.0) double featureDiameter, // D_work
    @Default(true) bool isInternal,       // Otwór / Czop
    
    // Wyniki
    @Default(0.0) double resultVf,      // Liniowy
    @Default(0.0) double resultVfArc,   // Skompensowany
    @Default(0.0) double resultF,       // Na obrót
  }) = _FeedRateState;
}