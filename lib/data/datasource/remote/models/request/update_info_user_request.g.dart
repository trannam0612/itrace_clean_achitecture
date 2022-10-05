// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoRequest _$UpdateUserInfoRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoRequest(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      provinceId: json['province_id'] as String?,
      districtId: json['district_id'] as String?,
      wardId: json['ward_id'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateUserInfoRequestToJson(
        UpdateUserInfoRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'ward_id': instance.wardId,
      'address': instance.address,
    };
