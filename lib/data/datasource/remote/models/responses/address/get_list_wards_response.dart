import 'package:json_annotation/json_annotation.dart';
part 'get_list_wards_response.g.dart';

@JsonSerializable()
class GetListWardsResponse {
  factory GetListWardsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListWardsResponseFromJson(json);

  GetListWardsResponse({
    this.status,
    this.message,
    this.wardItem,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<WardItem>? wardItem;

  Map<String, dynamic> toJson() => _$GetListWardsResponseToJson(this);
}

@JsonSerializable()
class WardItem {
  factory WardItem.fromJson(Map<String, dynamic> json) =>
      _$WardItemFromJson(json);

  WardItem({
    this.id,
    this.name,
    this.districtId,
    this.type,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'district_id')
  int? districtId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'type')
  String? type;

  Map<String, dynamic> toJson() => _$WardItemToJson(this);
}
