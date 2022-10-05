// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_wards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListWardsResponse _$GetListWardsResponseFromJson(
        Map<String, dynamic> json) =>
    GetListWardsResponse(
      status: json['status'] as int?,
      message: json['message'] as String?,
      wardItem: (json['data'] as List<dynamic>?)
          ?.map((e) => WardItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListWardsResponseToJson(
        GetListWardsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.wardItem,
    };

WardItem _$WardItemFromJson(Map<String, dynamic> json) => WardItem(
      id: json['id'] as int?,
      name: json['name'] as String?,
      districtId: json['district_id'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$WardItemToJson(WardItem instance) => <String, dynamic>{
      'id': instance.id,
      'district_id': instance.districtId,
      'name': instance.name,
      'type': instance.type,
    };
