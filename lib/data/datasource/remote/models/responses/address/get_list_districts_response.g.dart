// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_districts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListDistrictsResponse _$GetListDistrictsResponseFromJson(
        Map<String, dynamic> json) =>
    GetListDistrictsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      districtItem: (json['data'] as List<dynamic>?)
          ?.map((e) => DistrictItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListDistrictsResponseToJson(
        GetListDistrictsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.districtItem,
    };

DistrictItem _$DistrictItemFromJson(Map<String, dynamic> json) => DistrictItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      provinceId: json['province_id'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$DistrictItemToJson(DistrictItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province_id': instance.provinceId,
      'name': instance.name,
      'type': instance.type,
    };
