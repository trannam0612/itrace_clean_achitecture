import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'update_info_user_request.g.dart';

@JsonSerializable()
class UpdateUserInfoRequest {
  factory UpdateUserInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoRequestFromJson(json);
  UpdateUserInfoRequest({
    this.name,
    this.phone,
    this.email,
    this.provinceId,
    this.districtId,
    this.wardId,
    this.address,
  });

  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'province_id')
  String? provinceId;
  @JsonKey(name: 'district_id')
  String? districtId;
  @JsonKey(name: 'ward_id')
  String? wardId;
  @JsonKey(name: 'address')
  String? address;

  Map<String, dynamic> toJson() => _$UpdateUserInfoRequestToJson(this);
}
