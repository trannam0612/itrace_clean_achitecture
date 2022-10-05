import 'dart:io';

import 'package:itrace_247/data/datasource/remote/models/request/login_request.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_infor_user_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/login_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/update_info_user_response.dart';
import 'package:itrace_247/data/datasource/remote/sevices/user_sevices.dart';
import 'package:retrofit/retrofit.dart';

class UserDataSource {
  UserDataSource(this._userServices);
  final UserServices _userServices;

  Future<HttpResponse<GetUserInfoResponse>> getUserInfo() {
    return _userServices.getUserInfo();
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
    return _userServices.updateUserInfo(
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
