import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  LoginResponse({
    this.status,
    this.message,
    this.loginData,
  });
  
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  LoginData? loginData;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  LoginData({
    this.token,
    this.refeshToken,
  });
  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'refesh_token')
  String? refeshToken;

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
