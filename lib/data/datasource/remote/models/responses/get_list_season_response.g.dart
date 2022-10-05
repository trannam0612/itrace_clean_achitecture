// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_season_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListSeasonsResponse _$GetListSeasonsResponseFromJson(
        Map<String, dynamic> json) =>
    GetListSeasonsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SeasonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListSeasonsResponseToJson(
        GetListSeasonsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SeasonItem _$SeasonItemFromJson(Map<String, dynamic> json) => SeasonItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      companyId: json['company_id'] as int?,
      description: json['description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$SeasonItemToJson(SeasonItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'company_id': instance.companyId,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
