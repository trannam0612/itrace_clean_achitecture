import 'dart:io';

import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/core/usecases/usecase.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';

class UserUsecase {
  UserUsecase(this._userRepository);
  final UserRepository _userRepository;

  Future<DataState<UserEntity>> getUserInfo() {
    return _userRepository.getUserInfo();
  }

  Future<DataState<UserEntity>> updateUserInfo({
    required String name,
    required String phone,
    String? email,
    required String provinceId,
    required String districtId,
    required String wardId,
    required String address,
    File? avatar,
  }) {
    return _userRepository.updateUserInfo(
        name: name,
        phone: phone,
        email: email,
        provinceId: provinceId,
        districtId: districtId,
        wardId: wardId,
        address: address,
        avatar: avatar);
  }
}
