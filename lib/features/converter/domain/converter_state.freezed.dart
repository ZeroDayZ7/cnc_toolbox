// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConverterState {

 Map<String, String> get values; List<String> get favoriteUnits;
/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConverterStateCopyWith<ConverterState> get copyWith => _$ConverterStateCopyWithImpl<ConverterState>(this as ConverterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConverterState&&const DeepCollectionEquality().equals(other.values, values)&&const DeepCollectionEquality().equals(other.favoriteUnits, favoriteUnits));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(values),const DeepCollectionEquality().hash(favoriteUnits));

@override
String toString() {
  return 'ConverterState(values: $values, favoriteUnits: $favoriteUnits)';
}


}

/// @nodoc
abstract mixin class $ConverterStateCopyWith<$Res>  {
  factory $ConverterStateCopyWith(ConverterState value, $Res Function(ConverterState) _then) = _$ConverterStateCopyWithImpl;
@useResult
$Res call({
 Map<String, String> values, List<String> favoriteUnits
});




}
/// @nodoc
class _$ConverterStateCopyWithImpl<$Res>
    implements $ConverterStateCopyWith<$Res> {
  _$ConverterStateCopyWithImpl(this._self, this._then);

  final ConverterState _self;
  final $Res Function(ConverterState) _then;

/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? values = null,Object? favoriteUnits = null,}) {
  return _then(_self.copyWith(
values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<String, String>,favoriteUnits: null == favoriteUnits ? _self.favoriteUnits : favoriteUnits // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConverterState].
extension ConverterStatePatterns on ConverterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConverterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConverterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConverterState value)  $default,){
final _that = this;
switch (_that) {
case _ConverterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConverterState value)?  $default,){
final _that = this;
switch (_that) {
case _ConverterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, String> values,  List<String> favoriteUnits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConverterState() when $default != null:
return $default(_that.values,_that.favoriteUnits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, String> values,  List<String> favoriteUnits)  $default,) {final _that = this;
switch (_that) {
case _ConverterState():
return $default(_that.values,_that.favoriteUnits);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, String> values,  List<String> favoriteUnits)?  $default,) {final _that = this;
switch (_that) {
case _ConverterState() when $default != null:
return $default(_that.values,_that.favoriteUnits);case _:
  return null;

}
}

}

/// @nodoc


class _ConverterState implements ConverterState {
  const _ConverterState({final  Map<String, String> values = const {}, final  List<String> favoriteUnits = const []}): _values = values,_favoriteUnits = favoriteUnits;
  

 final  Map<String, String> _values;
@override@JsonKey() Map<String, String> get values {
  if (_values is EqualUnmodifiableMapView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_values);
}

 final  List<String> _favoriteUnits;
@override@JsonKey() List<String> get favoriteUnits {
  if (_favoriteUnits is EqualUnmodifiableListView) return _favoriteUnits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteUnits);
}


/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConverterStateCopyWith<_ConverterState> get copyWith => __$ConverterStateCopyWithImpl<_ConverterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConverterState&&const DeepCollectionEquality().equals(other._values, _values)&&const DeepCollectionEquality().equals(other._favoriteUnits, _favoriteUnits));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_values),const DeepCollectionEquality().hash(_favoriteUnits));

@override
String toString() {
  return 'ConverterState(values: $values, favoriteUnits: $favoriteUnits)';
}


}

/// @nodoc
abstract mixin class _$ConverterStateCopyWith<$Res> implements $ConverterStateCopyWith<$Res> {
  factory _$ConverterStateCopyWith(_ConverterState value, $Res Function(_ConverterState) _then) = __$ConverterStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, String> values, List<String> favoriteUnits
});




}
/// @nodoc
class __$ConverterStateCopyWithImpl<$Res>
    implements _$ConverterStateCopyWith<$Res> {
  __$ConverterStateCopyWithImpl(this._self, this._then);

  final _ConverterState _self;
  final $Res Function(_ConverterState) _then;

/// Create a copy of ConverterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? values = null,Object? favoriteUnits = null,}) {
  return _then(_ConverterState(
values: null == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as Map<String, String>,favoriteUnits: null == favoriteUnits ? _self._favoriteUnits : favoriteUnits // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
