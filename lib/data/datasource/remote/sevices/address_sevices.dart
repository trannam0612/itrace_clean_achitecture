import 'package:itrace_247/data/datasource/remote/data_source/address_data_source.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_districts_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_provinces_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_wards_response.dart';
import 'package:retrofit/dio.dart';

class AddressServices{
  AddressServices(this._addressDataSource);

  final AddressDataSource _addressDataSource;


  Future<HttpResponse<GetListProvincesResponse>> getListProvinces() {
    return _addressDataSource.getListProvinces();
  }

  Future<HttpResponse<GetListDistrictsResponse>> getListDistricts({
    required String idProvince,
  }) {
    return _addressDataSource.getListDistricts(idProvince: idProvince);
  }

  Future<HttpResponse<GetListWardsResponse>> getListWards({
    required String idDistrict,
  }) {
    return _addressDataSource.getListWards(idDistrict: idDistrict);
  }
}