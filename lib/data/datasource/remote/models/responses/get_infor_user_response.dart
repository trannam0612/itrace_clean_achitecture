import 'package:json_annotation/json_annotation.dart';
part 'get_infor_user_response.g.dart';

@JsonSerializable()
class GetUserInfoResponse {
  factory GetUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserInfoResponseFromJson(json);

  GetUserInfoResponse({
    this.status,
    this.message,
    this.loginData,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  UserInfoData? loginData;

  Map<String, dynamic> toJson() => _$GetUserInfoResponseToJson(this);
}

@JsonSerializable()
class UserInfoData {
  factory UserInfoData.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataFromJson(json);

  UserInfoData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.pinCode,
    this.avatar,
    this.active,
    this.province,
    this.district,
    this.ward,
    this.address,
    this.companyId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'pinCode')
  int? pinCode;
  @JsonKey(name: 'avatar')
  String? avatar;
  @JsonKey(name: 'active')
  int? active;
  @JsonKey(name: 'province')
  AddressUserData? province;
  @JsonKey(name: 'district')
  AddressUserData? district;
  @JsonKey(name: 'ward')
  AddressUserData? ward;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'company_id')
  int? companyId;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$UserInfoDataToJson(this);
}

@JsonSerializable()
class AddressUserData {
  factory AddressUserData.fromJson(Map<String, dynamic> json) =>
      _$AddressUserDataFromJson(json);

  AddressUserData({
    this.id,
    this.name,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  Map<String, dynamic> toJson() => _$AddressUserDataToJson(this);
}
