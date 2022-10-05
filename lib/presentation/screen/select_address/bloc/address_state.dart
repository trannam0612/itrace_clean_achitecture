part of 'address_bloc.dart';

class AddressState {
  AddressState({
    this.getListProvincesState,
    this.listProvinces,
    this.getListDistrictsState,
    this.listDistricts,
    this.getListWardsState,
    this.listWards,
  });

  final LoadState? getListProvincesState;
  final List<ProvinceEntity>? listProvinces;
  final LoadState? getListDistrictsState;
  final List<DistrictEntity>? listDistricts;
  final LoadState? getListWardsState;
  final List<WardEntity>? listWards;

  AddressState copyWith({
    LoadState? getListProvincesState,
    List<ProvinceEntity>? listProvinces,
    LoadState? getListDistrictsState,
    List<DistrictEntity>? listDistricts,
    LoadState? getListWardsState,
    List<WardEntity>? listWards,
  }) {
    return AddressState(
      getListProvincesState:
          getListProvincesState ?? this.getListProvincesState,
      listProvinces: listProvinces ?? this.listProvinces,
      getListDistrictsState:
          getListDistrictsState ?? this.getListDistrictsState,
      listDistricts: listDistricts ?? this.listDistricts,
      getListWardsState: getListWardsState ?? this.getListWardsState,
      listWards: listWards ?? this.listWards,
    );
  }
}
