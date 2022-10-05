// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_provinces_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListProvincesResponse _$GetListProvincesResponseFromJson(
        Map<String, dynamic> json) =>
    GetListProvincesResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      provinceItem: (json['data'] as List<dynamic>?)
          ?.map((e) => ProvinceItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListProvincesResponseToJson(
        GetListProvincesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.provinceItem,
    };

ProvinceItem _$ProvinceItemFromJson(Map<String, dynamic> json) => ProvinceItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProvinceItemToJson(ProvinceItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
