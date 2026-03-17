// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_rate_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FeedRateState {

// Wejścia podstawowe
 double get spindleSpeed; double get feedPerTooth; int get numberOfTeeth;// Obliczanie n z Vc
 double get cuttingSpeed;// Vc
 double get toolDiameter;// D
// Kompensacja łuku
 double get featureDiameter;// D_work
 bool get isInternal;// Otwór / Czop
// Wyniki
 double get resultVf;// Liniowy
 double get resultVfArc;// Skompensowany
 double get resultF;
/// Create a copy of FeedRateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedRateStateCopyWith<FeedRateState> get copyWith => _$FeedRateStateCopyWithImpl<FeedRateState>(this as FeedRateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedRateState&&(identical(other.spindleSpeed, spindleSpeed) || other.spindleSpeed == spindleSpeed)&&(identical(other.feedPerTooth, feedPerTooth) || other.feedPerTooth == feedPerTooth)&&(identical(other.numberOfTeeth, numberOfTeeth) || other.numberOfTeeth == numberOfTeeth)&&(identical(other.cuttingSpeed, cuttingSpeed) || other.cuttingSpeed == cuttingSpeed)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal)&&(identical(other.resultVf, resultVf) || other.resultVf == resultVf)&&(identical(other.resultVfArc, resultVfArc) || other.resultVfArc == resultVfArc)&&(identical(other.resultF, resultF) || other.resultF == resultF));
}


@override
int get hashCode => Object.hash(runtimeType,spindleSpeed,feedPerTooth,numberOfTeeth,cuttingSpeed,toolDiameter,featureDiameter,isInternal,resultVf,resultVfArc,resultF);

@override
String toString() {
  return 'FeedRateState(spindleSpeed: $spindleSpeed, feedPerTooth: $feedPerTooth, numberOfTeeth: $numberOfTeeth, cuttingSpeed: $cuttingSpeed, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, isInternal: $isInternal, resultVf: $resultVf, resultVfArc: $resultVfArc, resultF: $resultF)';
}


}

/// @nodoc
abstract mixin class $FeedRateStateCopyWith<$Res>  {
  factory $FeedRateStateCopyWith(FeedRateState value, $Res Function(FeedRateState) _then) = _$FeedRateStateCopyWithImpl;
@useResult
$Res call({
 double spindleSpeed, double feedPerTooth, int numberOfTeeth, double cuttingSpeed, double toolDiameter, double featureDiameter, bool isInternal, double resultVf, double resultVfArc, double resultF
});




}
/// @nodoc
class _$FeedRateStateCopyWithImpl<$Res>
    implements $FeedRateStateCopyWith<$Res> {
  _$FeedRateStateCopyWithImpl(this._self, this._then);

  final FeedRateState _self;
  final $Res Function(FeedRateState) _then;

/// Create a copy of FeedRateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spindleSpeed = null,Object? feedPerTooth = null,Object? numberOfTeeth = null,Object? cuttingSpeed = null,Object? toolDiameter = null,Object? featureDiameter = null,Object? isInternal = null,Object? resultVf = null,Object? resultVfArc = null,Object? resultF = null,}) {
  return _then(_self.copyWith(
spindleSpeed: null == spindleSpeed ? _self.spindleSpeed : spindleSpeed // ignore: cast_nullable_to_non_nullable
as double,feedPerTooth: null == feedPerTooth ? _self.feedPerTooth : feedPerTooth // ignore: cast_nullable_to_non_nullable
as double,numberOfTeeth: null == numberOfTeeth ? _self.numberOfTeeth : numberOfTeeth // ignore: cast_nullable_to_non_nullable
as int,cuttingSpeed: null == cuttingSpeed ? _self.cuttingSpeed : cuttingSpeed // ignore: cast_nullable_to_non_nullable
as double,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: null == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,resultVf: null == resultVf ? _self.resultVf : resultVf // ignore: cast_nullable_to_non_nullable
as double,resultVfArc: null == resultVfArc ? _self.resultVfArc : resultVfArc // ignore: cast_nullable_to_non_nullable
as double,resultF: null == resultF ? _self.resultF : resultF // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FeedRateState].
extension FeedRateStatePatterns on FeedRateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedRateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedRateState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedRateState value)  $default,){
final _that = this;
switch (_that) {
case _FeedRateState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedRateState value)?  $default,){
final _that = this;
switch (_that) {
case _FeedRateState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double spindleSpeed,  double feedPerTooth,  int numberOfTeeth,  double cuttingSpeed,  double toolDiameter,  double featureDiameter,  bool isInternal,  double resultVf,  double resultVfArc,  double resultF)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedRateState() when $default != null:
return $default(_that.spindleSpeed,_that.feedPerTooth,_that.numberOfTeeth,_that.cuttingSpeed,_that.toolDiameter,_that.featureDiameter,_that.isInternal,_that.resultVf,_that.resultVfArc,_that.resultF);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double spindleSpeed,  double feedPerTooth,  int numberOfTeeth,  double cuttingSpeed,  double toolDiameter,  double featureDiameter,  bool isInternal,  double resultVf,  double resultVfArc,  double resultF)  $default,) {final _that = this;
switch (_that) {
case _FeedRateState():
return $default(_that.spindleSpeed,_that.feedPerTooth,_that.numberOfTeeth,_that.cuttingSpeed,_that.toolDiameter,_that.featureDiameter,_that.isInternal,_that.resultVf,_that.resultVfArc,_that.resultF);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double spindleSpeed,  double feedPerTooth,  int numberOfTeeth,  double cuttingSpeed,  double toolDiameter,  double featureDiameter,  bool isInternal,  double resultVf,  double resultVfArc,  double resultF)?  $default,) {final _that = this;
switch (_that) {
case _FeedRateState() when $default != null:
return $default(_that.spindleSpeed,_that.feedPerTooth,_that.numberOfTeeth,_that.cuttingSpeed,_that.toolDiameter,_that.featureDiameter,_that.isInternal,_that.resultVf,_that.resultVfArc,_that.resultF);case _:
  return null;

}
}

}

/// @nodoc


class _FeedRateState implements FeedRateState {
  const _FeedRateState({this.spindleSpeed = 0.0, this.feedPerTooth = 0.0, this.numberOfTeeth = 1, this.cuttingSpeed = 0.0, this.toolDiameter = 0.0, this.featureDiameter = 0.0, this.isInternal = true, this.resultVf = 0.0, this.resultVfArc = 0.0, this.resultF = 0.0});
  

// Wejścia podstawowe
@override@JsonKey() final  double spindleSpeed;
@override@JsonKey() final  double feedPerTooth;
@override@JsonKey() final  int numberOfTeeth;
// Obliczanie n z Vc
@override@JsonKey() final  double cuttingSpeed;
// Vc
@override@JsonKey() final  double toolDiameter;
// D
// Kompensacja łuku
@override@JsonKey() final  double featureDiameter;
// D_work
@override@JsonKey() final  bool isInternal;
// Otwór / Czop
// Wyniki
@override@JsonKey() final  double resultVf;
// Liniowy
@override@JsonKey() final  double resultVfArc;
// Skompensowany
@override@JsonKey() final  double resultF;

/// Create a copy of FeedRateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedRateStateCopyWith<_FeedRateState> get copyWith => __$FeedRateStateCopyWithImpl<_FeedRateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedRateState&&(identical(other.spindleSpeed, spindleSpeed) || other.spindleSpeed == spindleSpeed)&&(identical(other.feedPerTooth, feedPerTooth) || other.feedPerTooth == feedPerTooth)&&(identical(other.numberOfTeeth, numberOfTeeth) || other.numberOfTeeth == numberOfTeeth)&&(identical(other.cuttingSpeed, cuttingSpeed) || other.cuttingSpeed == cuttingSpeed)&&(identical(other.toolDiameter, toolDiameter) || other.toolDiameter == toolDiameter)&&(identical(other.featureDiameter, featureDiameter) || other.featureDiameter == featureDiameter)&&(identical(other.isInternal, isInternal) || other.isInternal == isInternal)&&(identical(other.resultVf, resultVf) || other.resultVf == resultVf)&&(identical(other.resultVfArc, resultVfArc) || other.resultVfArc == resultVfArc)&&(identical(other.resultF, resultF) || other.resultF == resultF));
}


@override
int get hashCode => Object.hash(runtimeType,spindleSpeed,feedPerTooth,numberOfTeeth,cuttingSpeed,toolDiameter,featureDiameter,isInternal,resultVf,resultVfArc,resultF);

@override
String toString() {
  return 'FeedRateState(spindleSpeed: $spindleSpeed, feedPerTooth: $feedPerTooth, numberOfTeeth: $numberOfTeeth, cuttingSpeed: $cuttingSpeed, toolDiameter: $toolDiameter, featureDiameter: $featureDiameter, isInternal: $isInternal, resultVf: $resultVf, resultVfArc: $resultVfArc, resultF: $resultF)';
}


}

/// @nodoc
abstract mixin class _$FeedRateStateCopyWith<$Res> implements $FeedRateStateCopyWith<$Res> {
  factory _$FeedRateStateCopyWith(_FeedRateState value, $Res Function(_FeedRateState) _then) = __$FeedRateStateCopyWithImpl;
@override @useResult
$Res call({
 double spindleSpeed, double feedPerTooth, int numberOfTeeth, double cuttingSpeed, double toolDiameter, double featureDiameter, bool isInternal, double resultVf, double resultVfArc, double resultF
});




}
/// @nodoc
class __$FeedRateStateCopyWithImpl<$Res>
    implements _$FeedRateStateCopyWith<$Res> {
  __$FeedRateStateCopyWithImpl(this._self, this._then);

  final _FeedRateState _self;
  final $Res Function(_FeedRateState) _then;

/// Create a copy of FeedRateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spindleSpeed = null,Object? feedPerTooth = null,Object? numberOfTeeth = null,Object? cuttingSpeed = null,Object? toolDiameter = null,Object? featureDiameter = null,Object? isInternal = null,Object? resultVf = null,Object? resultVfArc = null,Object? resultF = null,}) {
  return _then(_FeedRateState(
spindleSpeed: null == spindleSpeed ? _self.spindleSpeed : spindleSpeed // ignore: cast_nullable_to_non_nullable
as double,feedPerTooth: null == feedPerTooth ? _self.feedPerTooth : feedPerTooth // ignore: cast_nullable_to_non_nullable
as double,numberOfTeeth: null == numberOfTeeth ? _self.numberOfTeeth : numberOfTeeth // ignore: cast_nullable_to_non_nullable
as int,cuttingSpeed: null == cuttingSpeed ? _self.cuttingSpeed : cuttingSpeed // ignore: cast_nullable_to_non_nullable
as double,toolDiameter: null == toolDiameter ? _self.toolDiameter : toolDiameter // ignore: cast_nullable_to_non_nullable
as double,featureDiameter: null == featureDiameter ? _self.featureDiameter : featureDiameter // ignore: cast_nullable_to_non_nullable
as double,isInternal: null == isInternal ? _self.isInternal : isInternal // ignore: cast_nullable_to_non_nullable
as bool,resultVf: null == resultVf ? _self.resultVf : resultVf // ignore: cast_nullable_to_non_nullable
as double,resultVfArc: null == resultVfArc ? _self.resultVfArc : resultVfArc // ignore: cast_nullable_to_non_nullable
as double,resultF: null == resultF ? _self.resultF : resultF // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
