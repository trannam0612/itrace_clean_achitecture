import 'package:json_annotation/json_annotation.dart';
part 'update_info_user_response.g.dart';

@JsonSerializable()
class UpdateUserInfoResponse {
  factory UpdateUserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoResponseFromJson(json);

  UpdateUserInfoResponse({
    this.status,
    this.message,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  UserInfoDataUpdated? loginData;

  Map<String, dynamic> toJson() => _$UpdateUserInfoResponseToJson(this);
}

@JsonSerializable()
class UserInfoDataUpdated {
  factory UserInfoDataUpdated.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDataUpdatedFromJson(json);

  UserInfoDataUpdated({
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
  AddressUserDataUpdated? province;
  @JsonKey(name: 'district')
  AddressUserDataUpdated? district;
  @JsonKey(name: 'ward')
  AddressUserDataUpdated? ward;
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

  Map<String, dynamic> toJson() => _$UserInfoDataUpdatedToJson(this);
}

@JsonSerializable()
class AddressUserDataUpdated {
  factory AddressUserDataUpdated.fromJson(Map<String, dynamic> json) =>
      _$AddressUserDataUpdatedFromJson(json);

  AddressUserDataUpdated({
    this.id,
    this.name,
  });
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;

  Map<String, dynamic> toJson() => _$AddressUserDataUpdatedToJson(this);
}
