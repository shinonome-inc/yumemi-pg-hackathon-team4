// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeDetailState {
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of RecipeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeDetailStateCopyWith<RecipeDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeDetailStateCopyWith<$Res> {
  factory $RecipeDetailStateCopyWith(
          RecipeDetailState value, $Res Function(RecipeDetailState) then) =
      _$RecipeDetailStateCopyWithImpl<$Res, RecipeDetailState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$RecipeDetailStateCopyWithImpl<$Res, $Val extends RecipeDetailState>
    implements $RecipeDetailStateCopyWith<$Res> {
  _$RecipeDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeDetailStateImplCopyWith<$Res>
    implements $RecipeDetailStateCopyWith<$Res> {
  factory _$$RecipeDetailStateImplCopyWith(_$RecipeDetailStateImpl value,
          $Res Function(_$RecipeDetailStateImpl) then) =
      __$$RecipeDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$RecipeDetailStateImplCopyWithImpl<$Res>
    extends _$RecipeDetailStateCopyWithImpl<$Res, _$RecipeDetailStateImpl>
    implements _$$RecipeDetailStateImplCopyWith<$Res> {
  __$$RecipeDetailStateImplCopyWithImpl(_$RecipeDetailStateImpl _value,
      $Res Function(_$RecipeDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$RecipeDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RecipeDetailStateImpl implements _RecipeDetailState {
  const _$RecipeDetailStateImpl({required this.isLoading});

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'RecipeDetailState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  /// Create a copy of RecipeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeDetailStateImplCopyWith<_$RecipeDetailStateImpl> get copyWith =>
      __$$RecipeDetailStateImplCopyWithImpl<_$RecipeDetailStateImpl>(
          this, _$identity);
}

abstract class _RecipeDetailState implements RecipeDetailState {
  const factory _RecipeDetailState({required final bool isLoading}) =
      _$RecipeDetailStateImpl;

  @override
  bool get isLoading;

  /// Create a copy of RecipeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeDetailStateImplCopyWith<_$RecipeDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
