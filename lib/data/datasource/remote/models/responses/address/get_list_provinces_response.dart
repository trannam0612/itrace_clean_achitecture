import 'package:json_annotation/json_annotation.dart';
part 'get_list_provinces_response.g.dart';

@JsonSerializable()
class GetListProvincesResponse {
  factory GetListProvincesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListProvincesResponseFromJson(json);

  GetListProvincesResponse({
    this.status,
    this.message,
    this.provinceItem,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<ProvinceItem>? provinceItem;

  Map<String, dynamic> toJson() => _$GetListProvincesResponseToJson(this);
}

@JsonSerializable()
class ProvinceItem {
  factory ProvinceItem.fromJson(Map<String, dynamic> json) =>
      _$ProvinceItemFromJson(json);

  ProvinceItem({
    this.id,
    this.name,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  Map<String, dynamic> toJson() => _$ProvinceItemToJson(this);
}
