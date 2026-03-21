// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_code_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GCode {

 String get code; String get titleKey; String get descriptionKey; String get example;
/// Create a copy of GCode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GCodeCopyWith<GCode> get copyWith => _$GCodeCopyWithImpl<GCode>(this as GCode, _$identity);

  /// Serializes this GCode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GCode&&(identical(other.code, code) || other.code == code)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,titleKey,descriptionKey,example);

@override
String toString() {
  return 'GCode(code: $code, titleKey: $titleKey, descriptionKey: $descriptionKey, example: $example)';
}


}

/// @nodoc
abstract mixin class $GCodeCopyWith<$Res>  {
  factory $GCodeCopyWith(GCode value, $Res Function(GCode) _then) = _$GCodeCopyWithImpl;
@useResult
$Res call({
 String code, String titleKey, String descriptionKey, String example
});




}
/// @nodoc
class _$GCodeCopyWithImpl<$Res>
    implements $GCodeCopyWith<$Res> {
  _$GCodeCopyWithImpl(this._self, this._then);

  final GCode _self;
  final $Res Function(GCode) _then;

/// Create a copy of GCode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? titleKey = null,Object? descriptionKey = null,Object? example = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GCode].
extension GCodePatterns on GCode {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GCode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GCode() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GCode value)  $default,){
final _that = this;
switch (_that) {
case _GCode():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GCode value)?  $default,){
final _that = this;
switch (_that) {
case _GCode() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String titleKey,  String descriptionKey,  String example)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GCode() when $default != null:
return $default(_that.code,_that.titleKey,_that.descriptionKey,_that.example);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String titleKey,  String descriptionKey,  String example)  $default,) {final _that = this;
switch (_that) {
case _GCode():
return $default(_that.code,_that.titleKey,_that.descriptionKey,_that.example);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String titleKey,  String descriptionKey,  String example)?  $default,) {final _that = this;
switch (_that) {
case _GCode() when $default != null:
return $default(_that.code,_that.titleKey,_that.descriptionKey,_that.example);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GCode implements GCode {
  const _GCode({required this.code, required this.titleKey, required this.descriptionKey, required this.example});
  factory _GCode.fromJson(Map<String, dynamic> json) => _$GCodeFromJson(json);

@override final  String code;
@override final  String titleKey;
@override final  String descriptionKey;
@override final  String example;

/// Create a copy of GCode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GCodeCopyWith<_GCode> get copyWith => __$GCodeCopyWithImpl<_GCode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GCodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GCode&&(identical(other.code, code) || other.code == code)&&(identical(other.titleKey, titleKey) || other.titleKey == titleKey)&&(identical(other.descriptionKey, descriptionKey) || other.descriptionKey == descriptionKey)&&(identical(other.example, example) || other.example == example));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,titleKey,descriptionKey,example);

@override
String toString() {
  return 'GCode(code: $code, titleKey: $titleKey, descriptionKey: $descriptionKey, example: $example)';
}


}

/// @nodoc
abstract mixin class _$GCodeCopyWith<$Res> implements $GCodeCopyWith<$Res> {
  factory _$GCodeCopyWith(_GCode value, $Res Function(_GCode) _then) = __$GCodeCopyWithImpl;
@override @useResult
$Res call({
 String code, String titleKey, String descriptionKey, String example
});




}
/// @nodoc
class __$GCodeCopyWithImpl<$Res>
    implements _$GCodeCopyWith<$Res> {
  __$GCodeCopyWithImpl(this._self, this._then);

  final _GCode _self;
  final $Res Function(_GCode) _then;

/// Create a copy of GCode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? titleKey = null,Object? descriptionKey = null,Object? example = null,}) {
  return _then(_GCode(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,titleKey: null == titleKey ? _self.titleKey : titleKey // ignore: cast_nullable_to_non_nullable
as String,descriptionKey: null == descriptionKey ? _self.descriptionKey : descriptionKey // ignore: cast_nullable_to_non_nullable
as String,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$GCodeState {

 String get searchQuery; List<GCode> get allCodes; List<GCode> get filteredCodes; bool get isLoading;
/// Create a copy of GCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GCodeStateCopyWith<GCodeState> get copyWith => _$GCodeStateCopyWithImpl<GCodeState>(this as GCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GCodeState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.allCodes, allCodes)&&const DeepCollectionEquality().equals(other.filteredCodes, filteredCodes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(allCodes),const DeepCollectionEquality().hash(filteredCodes),isLoading);

@override
String toString() {
  return 'GCodeState(searchQuery: $searchQuery, allCodes: $allCodes, filteredCodes: $filteredCodes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $GCodeStateCopyWith<$Res>  {
  factory $GCodeStateCopyWith(GCodeState value, $Res Function(GCodeState) _then) = _$GCodeStateCopyWithImpl;
@useResult
$Res call({
 String searchQuery, List<GCode> allCodes, List<GCode> filteredCodes, bool isLoading
});




}
/// @nodoc
class _$GCodeStateCopyWithImpl<$Res>
    implements $GCodeStateCopyWith<$Res> {
  _$GCodeStateCopyWithImpl(this._self, this._then);

  final GCodeState _self;
  final $Res Function(GCodeState) _then;

/// Create a copy of GCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchQuery = null,Object? allCodes = null,Object? filteredCodes = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,allCodes: null == allCodes ? _self.allCodes : allCodes // ignore: cast_nullable_to_non_nullable
as List<GCode>,filteredCodes: null == filteredCodes ? _self.filteredCodes : filteredCodes // ignore: cast_nullable_to_non_nullable
as List<GCode>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GCodeState].
extension GCodeStatePatterns on GCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GCodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GCodeState value)  $default,){
final _that = this;
switch (_that) {
case _GCodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _GCodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String searchQuery,  List<GCode> allCodes,  List<GCode> filteredCodes,  bool isLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GCodeState() when $default != null:
return $default(_that.searchQuery,_that.allCodes,_that.filteredCodes,_that.isLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String searchQuery,  List<GCode> allCodes,  List<GCode> filteredCodes,  bool isLoading)  $default,) {final _that = this;
switch (_that) {
case _GCodeState():
return $default(_that.searchQuery,_that.allCodes,_that.filteredCodes,_that.isLoading);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String searchQuery,  List<GCode> allCodes,  List<GCode> filteredCodes,  bool isLoading)?  $default,) {final _that = this;
switch (_that) {
case _GCodeState() when $default != null:
return $default(_that.searchQuery,_that.allCodes,_that.filteredCodes,_that.isLoading);case _:
  return null;

}
}

}

/// @nodoc


class _GCodeState implements GCodeState {
  const _GCodeState({this.searchQuery = '', final  List<GCode> allCodes = const [], final  List<GCode> filteredCodes = const [], this.isLoading = true}): _allCodes = allCodes,_filteredCodes = filteredCodes;
  

@override@JsonKey() final  String searchQuery;
 final  List<GCode> _allCodes;
@override@JsonKey() List<GCode> get allCodes {
  if (_allCodes is EqualUnmodifiableListView) return _allCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allCodes);
}

 final  List<GCode> _filteredCodes;
@override@JsonKey() List<GCode> get filteredCodes {
  if (_filteredCodes is EqualUnmodifiableListView) return _filteredCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredCodes);
}

@override@JsonKey() final  bool isLoading;

/// Create a copy of GCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GCodeStateCopyWith<_GCodeState> get copyWith => __$GCodeStateCopyWithImpl<_GCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GCodeState&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._allCodes, _allCodes)&&const DeepCollectionEquality().equals(other._filteredCodes, _filteredCodes)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,const DeepCollectionEquality().hash(_allCodes),const DeepCollectionEquality().hash(_filteredCodes),isLoading);

@override
String toString() {
  return 'GCodeState(searchQuery: $searchQuery, allCodes: $allCodes, filteredCodes: $filteredCodes, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$GCodeStateCopyWith<$Res> implements $GCodeStateCopyWith<$Res> {
  factory _$GCodeStateCopyWith(_GCodeState value, $Res Function(_GCodeState) _then) = __$GCodeStateCopyWithImpl;
@override @useResult
$Res call({
 String searchQuery, List<GCode> allCodes, List<GCode> filteredCodes, bool isLoading
});




}
/// @nodoc
class __$GCodeStateCopyWithImpl<$Res>
    implements _$GCodeStateCopyWith<$Res> {
  __$GCodeStateCopyWithImpl(this._self, this._then);

  final _GCodeState _self;
  final $Res Function(_GCodeState) _then;

/// Create a copy of GCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? allCodes = null,Object? filteredCodes = null,Object? isLoading = null,}) {
  return _then(_GCodeState(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,allCodes: null == allCodes ? _self._allCodes : allCodes // ignore: cast_nullable_to_non_nullable
as List<GCode>,filteredCodes: null == filteredCodes ? _self._filteredCodes : filteredCodes // ignore: cast_nullable_to_non_nullable
as List<GCode>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
