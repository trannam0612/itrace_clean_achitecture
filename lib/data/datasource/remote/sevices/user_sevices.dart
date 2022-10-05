import 'dart:developer';
import 'dart:io';

import 'package:itrace_247/data/datasource/remote/api/api.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_infor_user_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/update_info_user_response.dart';
import 'package:retrofit/retrofit.dart';

class UserServices {
  UserServices(this._api);
  final Api _api;

  Future<HttpResponse<GetUserInfoResponse>> getUserInfo() {
    return _api.getUserInfo();
  }

  Future<HttpResponse<UpdateUserInfoResponse>> updateUserInfo({
    required String name,
    required String phone,
    String? email,
    required String provinceId,
    required String districtId,
    required String wardId,
    required String address,
    File? avatar,
  }) {
    if (avatar == null) {
      return _api.updateUserInfo(
        name: name,
        email: email,
        phone: phone,
        provinceId: provinceId,
        districtId: districtId,
        wardId: wardId,
        address: address,
      );
    } else {
      return _api.updateUserInfoWithAvatar(
        name: name,
        email: email,
        phone: phone,
        provinceId: provinceId,
        districtId: districtId,
        wardId: wardId,
        address: address,
        avatar: avatar,
      );
    }
  }
}
