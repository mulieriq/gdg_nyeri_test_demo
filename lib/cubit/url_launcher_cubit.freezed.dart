// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'url_launcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UrlLauncherState {
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UrlLauncherStateCopyWith<UrlLauncherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UrlLauncherStateCopyWith<$Res> {
  factory $UrlLauncherStateCopyWith(
          UrlLauncherState value, $Res Function(UrlLauncherState) then) =
      _$UrlLauncherStateCopyWithImpl<$Res, UrlLauncherState>;
  @useResult
  $Res call({Status status});
}

/// @nodoc
class _$UrlLauncherStateCopyWithImpl<$Res, $Val extends UrlLauncherState>
    implements $UrlLauncherStateCopyWith<$Res> {
  _$UrlLauncherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UrlLauncherStateCopyWith<$Res>
    implements $UrlLauncherStateCopyWith<$Res> {
  factory _$$_UrlLauncherStateCopyWith(
          _$_UrlLauncherState value, $Res Function(_$_UrlLauncherState) then) =
      __$$_UrlLauncherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status});
}

/// @nodoc
class __$$_UrlLauncherStateCopyWithImpl<$Res>
    extends _$UrlLauncherStateCopyWithImpl<$Res, _$_UrlLauncherState>
    implements _$$_UrlLauncherStateCopyWith<$Res> {
  __$$_UrlLauncherStateCopyWithImpl(
      _$_UrlLauncherState _value, $Res Function(_$_UrlLauncherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_UrlLauncherState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$_UrlLauncherState extends _UrlLauncherState {
  _$_UrlLauncherState({required this.status}) : super._();

  @override
  final Status status;

  @override
  String toString() {
    return 'UrlLauncherState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UrlLauncherState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UrlLauncherStateCopyWith<_$_UrlLauncherState> get copyWith =>
      __$$_UrlLauncherStateCopyWithImpl<_$_UrlLauncherState>(this, _$identity);
}

abstract class _UrlLauncherState extends UrlLauncherState {
  factory _UrlLauncherState({required final Status status}) =
      _$_UrlLauncherState;
  _UrlLauncherState._() : super._();

  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$_UrlLauncherStateCopyWith<_$_UrlLauncherState> get copyWith =>
      throw _privateConstructorUsedError;
}
