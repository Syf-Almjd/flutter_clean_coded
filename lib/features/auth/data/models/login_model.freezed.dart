// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginModelRequest _$LoginModelRequestFromJson(Map<String, dynamic> json) {
  return _LoginModelRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginModelRequest {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Serializes this LoginModelRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginModelRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginModelRequestCopyWith<LoginModelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelRequestCopyWith<$Res> {
  factory $LoginModelRequestCopyWith(
          LoginModelRequest value, $Res Function(LoginModelRequest) then) =
      _$LoginModelRequestCopyWithImpl<$Res, LoginModelRequest>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginModelRequestCopyWithImpl<$Res, $Val extends LoginModelRequest>
    implements $LoginModelRequestCopyWith<$Res> {
  _$LoginModelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginModelRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginModelRequestImplCopyWith<$Res>
    implements $LoginModelRequestCopyWith<$Res> {
  factory _$$LoginModelRequestImplCopyWith(_$LoginModelRequestImpl value,
          $Res Function(_$LoginModelRequestImpl) then) =
      __$$LoginModelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginModelRequestImplCopyWithImpl<$Res>
    extends _$LoginModelRequestCopyWithImpl<$Res, _$LoginModelRequestImpl>
    implements _$$LoginModelRequestImplCopyWith<$Res> {
  __$$LoginModelRequestImplCopyWithImpl(_$LoginModelRequestImpl _value,
      $Res Function(_$LoginModelRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginModelRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginModelRequestImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginModelRequestImpl implements _LoginModelRequest {
  const _$LoginModelRequestImpl({required this.email, required this.password});

  factory _$LoginModelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginModelRequestImplFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginModelRequest(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginModelRequestImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of LoginModelRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginModelRequestImplCopyWith<_$LoginModelRequestImpl> get copyWith =>
      __$$LoginModelRequestImplCopyWithImpl<_$LoginModelRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginModelRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginModelRequest implements LoginModelRequest {
  const factory _LoginModelRequest(
      {required final String email,
      required final String password}) = _$LoginModelRequestImpl;

  factory _LoginModelRequest.fromJson(Map<String, dynamic> json) =
      _$LoginModelRequestImpl.fromJson;

  @override
  String get email;
  @override
  String get password;

  /// Create a copy of LoginModelRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginModelRequestImplCopyWith<_$LoginModelRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
