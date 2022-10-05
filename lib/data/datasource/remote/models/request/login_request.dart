import 'package:json_annotation/json_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  LoginRequest({
    this.pinCode,
  });

  @JsonKey(name: 'pin_code')
  String? pinCode;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
