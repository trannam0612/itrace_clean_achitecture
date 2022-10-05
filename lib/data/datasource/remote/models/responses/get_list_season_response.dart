import 'package:json_annotation/json_annotation.dart';
part 'get_list_season_response.g.dart';

@JsonSerializable()
class GetListSeasonsResponse {
  factory GetListSeasonsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListSeasonsResponseFromJson(json);
  GetListSeasonsResponse({
    this.status,
    this.message,
    this.data,
  });
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  List<SeasonItem>? data;
  Map<String, dynamic> toJson() => _$GetListSeasonsResponseToJson(this);
}

@JsonSerializable()
class SeasonItem {
  factory SeasonItem.fromJson(Map<String, dynamic> json) =>
      _$SeasonItemFromJson(json);
  SeasonItem({
    this.id,
    this.name,
    this.status,
    this.companyId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'company_id')
  int? companyId;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'deleted_at')
  DateTime? deletedAt;
  Map<String, dynamic> toJson() => _$SeasonItemToJson(this);
}
