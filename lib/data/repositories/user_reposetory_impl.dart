import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/data/datasource/remote/data_source/user_data_source.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_infor_user_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/update_info_user_response.dart';
import 'package:itrace_247/data/models/user_model.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:retrofit/dio.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userDataSource);
  final UserDataSource _userDataSource;
  @override
  Future<DataState<UserModel>> getUserInfo({String? pinCode}) async {
    try {
      final HttpResponse<GetUserInfoResponse> result =
          await _userDataSource.getUserInfo();
      if (result.response.statusCode == HttpStatus.ok) {
        log('result:${jsonEncode(result.data.loginData)}');
        final UserModel userModel = UserModel(
          id: result.data.loginData?.id,
          active: result.data.loginData?.active,
          avatar: result.data.loginData?.avatar,
          companyId: result.data.loginData?.id,
          name: result.data.loginData?.name,
          phone: result.data.loginData?.phone,
          province: AddressUserDataEntity(
            id: result.data.loginData?.province?.id,
            name: result.data.loginData?.province?.name,
          ),
          district: AddressUserDataEntity(
            id: result.data.loginData?.district?.id,
            name: result.data.loginData?.district?.name,
          ),
          ward: AddressUserDataEntity(
            id: result.data.loginData?.ward?.id,
            name: result.data.loginData?.ward?.name,
          ),
          pinCode: result.data.loginData?.pinCode,
          address: result.data.loginData?.address,
          email: result.data.loginData?.email,
          createdAt: result.data.loginData?.createdAt,
          deletedAt: result.data.loginData?.deletedAt,
          updatedAt: result.data.loginData?.updatedAt,
        );

        return DataSuccess(userModel);
      } else {
        return DataFailed(
          DioError(
            error: result.response.statusMessage,
            type: DioErrorType.response,
            response: result.response,
            requestOptions: result.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      print('e:$e');
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserModel>> updateUserInfo({
    required String name,
    required String phone,
    String? email,
    required String provinceId,
    required String districtId,
    required String wardId,
    required String address,
    File? avatar,
  }) async {
    try {
      final HttpResponse<UpdateUserInfoResponse> result =
          await _userDataSource.updateUserInfo(
        name: name,
        phone: phone,
        email: email,
        provinceId: provinceId,
        districtId: districtId,
        wardId: wardId,
        address: address,
        avatar: avatar,
      );
      log('result:${result.data.loginData?.province?.id.runtimeType}');
      if (result.response.statusCode == HttpStatus.ok) {
        final UserModel userModel = UserModel(
          id: result.data.loginData?.id,
          active: result.data.loginData?.active,
          avatar: result.data.loginData?.avatar,
          companyId: result.data.loginData?.id,
          name: result.data.loginData?.name,
          phone: result.data.loginData?.phone,
          province: AddressUserDataEntity(
            id: int.parse(result.data.loginData?.province?.id ?? '0'),
            name: result.data.loginData?.province?.name,
          ),
          district: AddressUserDataEntity(
            id: int.parse(result.data.loginData?.district?.id ?? '0'),
            name: result.data.loginData?.district?.name,
          ),
          ward: AddressUserDataEntity(
            id: int.parse(result.data.loginData?.ward?.id ?? '0'),
            name: result.data.loginData?.ward?.name,
          ),
          pinCode: result.data.loginData?.pinCode,
          address: result.data.loginData?.address,
          email: result.data.loginData?.email,
          createdAt: result.data.loginData?.createdAt,
          deletedAt: result.data.loginData?.deletedAt,
          updatedAt: result.data.loginData?.updatedAt,
        );

        return DataSuccess(userModel);
      } else {
        return DataFailed(
          DioError(
            error: result.response.statusMessage,
            type: DioErrorType.response,
            response: result.response,
            requestOptions: result.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
