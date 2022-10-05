import 'dart:io';

import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<DataState<UserEntity>> getUserInfo();
  Future<DataState<UserEntity>> updateUserInfo({
    required String name,
    required String phone,
    String? email,
    required String provinceId,
    required String districtId,
    required String wardId,
    required String address,
    File? avatar,
  });
}
