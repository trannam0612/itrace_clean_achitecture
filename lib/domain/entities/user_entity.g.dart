// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      pinCode: json['pinCode'] as int?,
      avatar: json['avatar'] as String?,
      active: json['active'] as int?,
      province: json['province'] == null
          ? null
          : AddressUserDataEntity.fromJson(
              json['province'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : AddressUserDataEntity.fromJson(
              json['district'] as Map<String, dynamic>),
      ward: json['ward'] == null
          ? null
          : AddressUserDataEntity.fromJson(
              json['ward'] as Map<String, dynamic>),
      address: json['address'] as String?,
      companyId: json['companyId'] as int?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
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
      'companyId': instance.companyId,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

AddressUserDataEntity _$AddressUserDataEntityFromJson(
        Map<String, dynamic> json) =>
    AddressUserDataEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AddressUserDataEntityToJson(
        AddressUserDataEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
