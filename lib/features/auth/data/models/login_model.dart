import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

/// Request payload for user login operations.
@freezed
class LoginModelRequest with _$LoginModelRequest {
  const factory LoginModelRequest({
    required String email,
    required String password,
  }) = _LoginModelRequest;

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginModelRequestFromJson(json);
}
