import 'dart:io';

import 'package:dio/dio.dart';
import 'package:itrace_247/data/datasource/remote/data_source/address_data_source.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_districts_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_provinces_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_wards_response.dart';
import 'package:itrace_247/data/datasource/remote/sevices/address_sevices.dart';
import 'package:itrace_247/data/models/address_model/district_model.dart';
import 'package:itrace_247/data/models/address_model/province_model.dart';
import 'package:itrace_247/data/models/address_model/ward_model.dart';
import 'package:itrace_247/domain/entities/address/ward_entity.dart';
import 'package:itrace_247/domain/entities/address/district_entity.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/repositories/address_reponsetory.dart';
import 'package:retrofit/dio.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl(this._addressDataSource);

  final AddressDataSource _addressDataSource;
  @override
  Future<DataState<List<ProvinceModel>>> getListProvinces() async {
    try {
      final HttpResponse<GetListProvincesResponse> result =
          await _addressDataSource.getListProvinces();
      List<ProvinceModel> listProvinces = <ProvinceModel>[];
      for (ProvinceItem element
          in result.data.provinceItem ?? <ProvinceItem>[]) {
        listProvinces.add(ProvinceModel(id: element.id, name: element.name));
      }

      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(listProvinces);
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

  @override
  Future<DataState<List<DistrictEntity>>> getListDistricts({
    required String provinceId,
  }) async {
    try {
      final HttpResponse<GetListDistrictsResponse> result =
          await _addressDataSource.getListDistricts(idProvince: provinceId);
      List<DistrictModel> listDistricts = <DistrictModel>[];
      for (DistrictItem element
          in result.data.districtItem ?? <DistrictItem>[]) {
        listDistricts.add(DistrictModel(id: element.id, name: element.name));
      }

      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(listDistricts);
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

  @override
  Future<DataState<List<WardEntity>>> getListWards({
    required String districtId,
  }) async {
    try {
      final HttpResponse<GetListWardsResponse> result =
          await _addressDataSource.getListWards(idDistrict: districtId);
      List<WardModel> listWards = <WardModel>[];
      for (WardItem element in result.data.wardItem ?? <WardItem>[]) {
        listWards.add(WardModel(id: element.id, name: element.name));
      }

      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(listWards);
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
