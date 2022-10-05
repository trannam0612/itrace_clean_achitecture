import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/data/datasource/remote/data_source/login_data_source.dart';
import 'package:itrace_247/data/datasource/remote/models/request/login_request.dart';
import 'package:itrace_247/domain/entities/login_entity.dart';
import 'package:itrace_247/domain/repositories/login_reposetory.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryImpl(this._loginDataSource);
  @override
  Future<DataState<LoginEntity>> login({String? pinCode}) async {
    try {
      final result =
          await _loginDataSource.login(LoginRequest(pinCode: pinCode));
      final loginEntity = LoginEntity(
        message: result.data.message,
        status: result.data.status,
        loginData: LoginData(
            refreshToken: result.data.loginData?.refeshToken ?? '',
            token: result.data.loginData?.token ?? ','),
      );
      if (result.response.statusCode == HttpStatus.ok) {
        if (result.data.status == 0) {
          return DataSuccess(loginEntity);
        } else {
          return DataFailed(
              DioError(requestOptions: result.response.requestOptions),
              data: loginEntity);
        }
      } else {
        return DataFailed(DioError(
          error: result.response.statusMessage,
          type: DioErrorType.response,
          response: result.response,
          requestOptions: result.response.requestOptions,
        ));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
