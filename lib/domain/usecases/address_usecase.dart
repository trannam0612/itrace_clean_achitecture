import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/address/district_entity.dart';
import 'package:itrace_247/domain/entities/address/province_entity.dart';
import 'package:itrace_247/domain/entities/address/ward_entity.dart';
import 'package:itrace_247/domain/repositories/address_reponsetory.dart';

class AddressUseCase {
  AddressUseCase(this._addressReponsetory);

  final AddressRepository _addressReponsetory;
  Future<DataState<List<ProvinceEntity>>> getListProvinces() {
    return _addressReponsetory.getListProvinces();
  }

  Future<DataState<List<DistrictEntity>>> getListDistricts({
    required String provinceId,
  }) {
    return _addressReponsetory.getListDistricts(provinceId: provinceId);
  }

  Future<DataState<List<WardEntity>>> getListWards({
    required String districtId,
  }) {
    return _addressReponsetory.getListWards(districtId: districtId);
  }
}
