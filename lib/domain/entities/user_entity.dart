import 'package:json_annotation/json_annotation.dart';
part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.pinCode,
    this.avatar,
    this.active,
    this.province,
    this.district,
    this.ward,
    this.address,
    this.companyId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  int? pinCode;
  String? avatar;
  int? active;
  AddressUserDataEntity? province;
  AddressUserDataEntity? district;
  AddressUserDataEntity? ward;
  String? address;
  int? companyId;
  DateTime? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

@JsonSerializable()
class AddressUserDataEntity {
  factory AddressUserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$AddressUserDataEntityFromJson(json);

  AddressUserDataEntity({
    this.id,
    this.name,
  });
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  Map<String, dynamic> toJson() => _$AddressUserDataEntityToJson(this);
}
