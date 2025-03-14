// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_steps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CookingSteps _$CookingStepsFromJson(Map<String, dynamic> json) {
  return _CookingSteps.fromJson(json);
}

/// @nodoc
mixin _$CookingSteps {
  String get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this CookingSteps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CookingSteps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CookingStepsCopyWith<CookingSteps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingStepsCopyWith<$Res> {
  factory $CookingStepsCopyWith(
          CookingSteps value, $Res Function(CookingSteps) then) =
      _$CookingStepsCopyWithImpl<$Res, CookingSteps>;
  @useResult
  $Res call({String id, String? imageUrl, String description});
}

/// @nodoc
class _$CookingStepsCopyWithImpl<$Res, $Val extends CookingSteps>
    implements $CookingStepsCopyWith<$Res> {
  _$CookingStepsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CookingSteps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CookingStepsImplCopyWith<$Res>
    implements $CookingStepsCopyWith<$Res> {
  factory _$$CookingStepsImplCopyWith(
          _$CookingStepsImpl value, $Res Function(_$CookingStepsImpl) then) =
      __$$CookingStepsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? imageUrl, String description});
}

/// @nodoc
class __$$CookingStepsImplCopyWithImpl<$Res>
    extends _$CookingStepsCopyWithImpl<$Res, _$CookingStepsImpl>
    implements _$$CookingStepsImplCopyWith<$Res> {
  __$$CookingStepsImplCopyWithImpl(
      _$CookingStepsImpl _value, $Res Function(_$CookingStepsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CookingSteps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = freezed,
    Object? description = null,
  }) {
    return _then(_$CookingStepsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CookingStepsImpl implements _CookingSteps {
  const _$CookingStepsImpl(
      {required this.id, required this.imageUrl, required this.description});

  factory _$CookingStepsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CookingStepsImplFromJson(json);

  @override
  final String id;
  @override
  final String? imageUrl;
  @override
  final String description;

  @override
  String toString() {
    return 'CookingSteps(id: $id, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookingStepsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, description);

  /// Create a copy of CookingSteps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CookingStepsImplCopyWith<_$CookingStepsImpl> get copyWith =>
      __$$CookingStepsImplCopyWithImpl<_$CookingStepsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CookingStepsImplToJson(
      this,
    );
  }
}

abstract class _CookingSteps implements CookingSteps {
  const factory _CookingSteps(
      {required final String id,
      required final String? imageUrl,
      required final String description}) = _$CookingStepsImpl;

  factory _CookingSteps.fromJson(Map<String, dynamic> json) =
      _$CookingStepsImpl.fromJson;

  @override
  String get id;
  @override
  String? get imageUrl;
  @override
  String get description;

  /// Create a copy of CookingSteps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CookingStepsImplCopyWith<_$CookingStepsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
