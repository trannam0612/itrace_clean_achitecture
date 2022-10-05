import 'package:json_annotation/json_annotation.dart';
part 'get_list_districts_response.g.dart';

@JsonSerializable()
class GetListDistrictsResponse {
  factory GetListDistrictsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListDistrictsResponseFromJson(json);

  GetListDistrictsResponse({
    this.status,
    this.message,
    this.districtItem,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<DistrictItem>? districtItem;

  Map<String, dynamic> toJson() => _$GetListDistrictsResponseToJson(this);
}

@JsonSerializable()
class DistrictItem {
  factory DistrictItem.fromJson(Map<String, dynamic> json) =>
      _$DistrictItemFromJson(json);

  DistrictItem({
    this.id,
    this.name,
    this.provinceId,
    this.type,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'province_id')
  int? provinceId;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'type')
  String? type;

  Map<String, dynamic> toJson() => _$DistrictItemToJson(this);
}
