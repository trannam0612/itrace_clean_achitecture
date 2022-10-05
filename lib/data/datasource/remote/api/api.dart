import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/data/datasource/remote/models/request/login_request.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_districts_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_provinces_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_wards_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_infor_user_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/get_list_season_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/login_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/update_info_user_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api.g.dart';

@RestApi()
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @POST('/auth/login')
  Future<HttpResponse<LoginResponse>> login(
    @Body() LoginRequest loginRequest,
  );
  @GET('/auth/get-user-info')
  Future<HttpResponse<GetUserInfoResponse>> getUserInfo();

  @GET('/auth/get-seasons')
  Future<HttpResponse<GetListSeasonsResponse>> getListSeasons({
    @Query('company_id') required String companyId,
  });

  @GET('/get-provinces')
  Future<HttpResponse<GetListProvincesResponse>> getListProvinces();

  @GET('/get-districts')
  Future<HttpResponse<GetListDistrictsResponse>> getListDistricts({
    @Query('idProvince') required String idProvince,
  });

  @GET('/get-wards')
  Future<HttpResponse<GetListWardsResponse>> getListWards({
    @Query('idDistrict') required String idDistrict,
  });

  @MultiPart()
  @POST('/auth/update-user')
  Future<HttpResponse<UpdateUserInfoResponse>> updateUserInfo({
    @Part(name: 'name') required String name,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') required String phone,
    @Part(name: 'province_id') required String provinceId,
    @Part(name: 'district_id') required String districtId,
    @Part(name: 'ward_id') required String wardId,
    @Part(name: 'address') required String address,
  });

  @MultiPart()
  @POST('/auth/update-user')
  Future<HttpResponse<UpdateUserInfoResponse>> updateUserInfoWithAvatar({
    @Part(name: 'avatar') required File avatar,
    @Part(name: 'name') required String name,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') required String phone,
    @Part(name: 'province_id') required String provinceId,
    @Part(name: 'district_id') required String districtId,
    @Part(name: 'ward_id') required String wardId,
    @Part(name: 'address') required String address,
  });
}
