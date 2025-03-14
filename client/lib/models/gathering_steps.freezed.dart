// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gathering_steps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GatheringSteps _$GatheringStepsFromJson(Map<String, dynamic> json) {
  return _GatheringSteps.fromJson(json);
}

/// @nodoc
mixin _$GatheringSteps {
  String get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this GatheringSteps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GatheringSteps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GatheringStepsCopyWith<GatheringSteps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GatheringStepsCopyWith<$Res> {
  factory $GatheringStepsCopyWith(
          GatheringSteps value, $Res Function(GatheringSteps) then) =
      _$GatheringStepsCopyWithImpl<$Res, GatheringSteps>;
  @useResult
  $Res call({String id, String? imageUrl, String description});
}

/// @nodoc
class _$GatheringStepsCopyWithImpl<$Res, $Val extends GatheringSteps>
    implements $GatheringStepsCopyWith<$Res> {
  _$GatheringStepsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GatheringSteps
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
abstract class _$$GatheringStepsImplCopyWith<$Res>
    implements $GatheringStepsCopyWith<$Res> {
  factory _$$GatheringStepsImplCopyWith(_$GatheringStepsImpl value,
          $Res Function(_$GatheringStepsImpl) then) =
      __$$GatheringStepsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? imageUrl, String description});
}

/// @nodoc
class __$$GatheringStepsImplCopyWithImpl<$Res>
    extends _$GatheringStepsCopyWithImpl<$Res, _$GatheringStepsImpl>
    implements _$$GatheringStepsImplCopyWith<$Res> {
  __$$GatheringStepsImplCopyWithImpl(
      _$GatheringStepsImpl _value, $Res Function(_$GatheringStepsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GatheringSteps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? imageUrl = freezed,
    Object? description = null,
  }) {
    return _then(_$GatheringStepsImpl(
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
class _$GatheringStepsImpl implements _GatheringSteps {
  const _$GatheringStepsImpl(
      {required this.id, required this.imageUrl, required this.description});

  factory _$GatheringStepsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GatheringStepsImplFromJson(json);

  @override
  final String id;
  @override
  final String? imageUrl;
  @override
  final String description;

  @override
  String toString() {
    return 'GatheringSteps(id: $id, imageUrl: $imageUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GatheringStepsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, imageUrl, description);

  /// Create a copy of GatheringSteps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GatheringStepsImplCopyWith<_$GatheringStepsImpl> get copyWith =>
      __$$GatheringStepsImplCopyWithImpl<_$GatheringStepsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GatheringStepsImplToJson(
      this,
    );
  }
}

abstract class _GatheringSteps implements GatheringSteps {
  const factory _GatheringSteps(
      {required final String id,
      required final String? imageUrl,
      required final String description}) = _$GatheringStepsImpl;

  factory _GatheringSteps.fromJson(Map<String, dynamic> json) =
      _$GatheringStepsImpl.fromJson;

  @override
  String get id;
  @override
  String? get imageUrl;
  @override
  String get description;

  /// Create a copy of GatheringSteps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GatheringStepsImplCopyWith<_$GatheringStepsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
