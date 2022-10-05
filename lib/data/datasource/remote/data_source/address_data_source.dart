import 'package:itrace_247/data/datasource/remote/api/api.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_districts_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_provinces_response.dart';
import 'package:itrace_247/data/datasource/remote/models/responses/address/get_list_wards_response.dart';
import 'package:retrofit/dio.dart';

class AddressDataSource {
  AddressDataSource(this._api);

  final Api _api;

  Future<HttpResponse<GetListProvincesResponse>> getListProvinces() {
    return _api.getListProvinces();
  }

  Future<HttpResponse<GetListDistrictsResponse>> getListDistricts({
    required String idProvince,
  }) {
    return _api.getListDistricts(idProvince: idProvince);
  }

  Future<HttpResponse<GetListWardsResponse>> getListWards({
    required String idDistrict,
  }) {
    return _api.getListWards(idDistrict: idDistrict);
  }
}
