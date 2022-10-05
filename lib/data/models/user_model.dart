import 'package:itrace_247/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? pinCode,
    String? avatar,
    int? active,
    AddressUserDataEntity? province,
    AddressUserDataEntity? district,
    AddressUserDataEntity? ward,
    String? address,
    int? companyId,
    DateTime? deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? message,
  }) : super(
          id: id,
          name: name,
          email: email,
          phone: phone,
          pinCode: pinCode,
          avatar: avatar,
          active: active,
          province: province,
          district: district,
          ward: ward,
          address: address,
          companyId: companyId,
          deletedAt: deletedAt,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
}
