import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/address/district_entity.dart';
import 'package:itrace_247/domain/entities/address/province_entity.dart';
import 'package:itrace_247/domain/entities/address/ward_entity.dart';

abstract class AddressRepository {
  Future<DataState<List<ProvinceEntity>>> getListProvinces();
  Future<DataState<List<DistrictEntity>>> getListDistricts({
    required String provinceId,
  });
  Future<DataState<List<WardEntity>>> getListWards({
    required String districtId,
  });
}
