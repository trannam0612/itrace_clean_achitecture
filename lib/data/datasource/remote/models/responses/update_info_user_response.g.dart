// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateUserInfoResponse _$UpdateUserInfoResponseFromJson(
        Map<String, dynamic> json) =>
    UpdateUserInfoResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
    )..loginData = json['data'] == null
        ? null
        : UserInfoDataUpdated.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateUserInfoResponseToJson(
        UpdateUserInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.loginData,
    };

UserInfoDataUpdated _$UserInfoDataUpdatedFromJson(Map<String, dynamic> json) =>
    UserInfoDataUpdated(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      pinCode: json['pinCode'] as int?,
      avatar: json['avatar'] as String?,
      active: json['active'] as int?,
      province: json['province'] == null
          ? null
          : AddressUserDataUpdated.fromJson(
              json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : AddressUserDataUpdated.fromJson(
              json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : AddressUserDataUpdated.fromJson(
              json['ward'] as Map<String, dynamic>),
      address: json['address'] as String?,
      companyId: json['company_id'] as int?,
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserInfoDataUpdatedToJson(
        UserInfoDataUpdated instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'pinCode': instance.pinCode,
      'avatar': instance.avatar,
      'active': instance.active,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'address': instance.address,
      'company_id': instance.companyId,
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

AddressUserDataUpdated _$AddressUserDataUpdatedFromJson(
        Map<String, dynamic> json) =>
    AddressUserDataUpdated(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressUserDataUpdatedToJson(
        AddressUserDataUpdated instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
