import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/address/district_entity.dart';
import 'package:itrace_247/domain/entities/address/province_entity.dart';
import 'package:itrace_247/domain/entities/address/ward_entity.dart';
import 'package:itrace_247/domain/usecases/address_usecase.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc(this._addressUseCase) : super(AddressState()) {
    on<GetListProvincesEvent>(
      _handelGetListProvinces,
    );
    on<GetListDistrictsEvent>(
      _handelGetListDistricts,
    );
    on<GetListWardsEvent>(
      _handelGetListWards,
    );
  }
  final AddressUseCase _addressUseCase;

  FutureOr<void> _handelGetListProvinces(
    GetListProvincesEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(getListProvincesState: LoadState.loading));
    final DataState<List<ProvinceEntity>> data =
        await _addressUseCase.getListProvinces();

    if (data.isSuccess()) {
      emit(
        state.copyWith(
          getListProvincesState: LoadState.success,
          listProvinces: data.data,
        ),
      );
    } else {
      emit(state.copyWith(getListProvincesState: LoadState.failure));
    }
  }

  FutureOr<void> _handelGetListDistricts(
    GetListDistrictsEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(getListDistrictsState: LoadState.loading));
    final DataState<List<DistrictEntity>> data =
        await _addressUseCase.getListDistricts(provinceId: event.idProvince);

    if (data.isSuccess()) {
      emit(
        state.copyWith(
          getListDistrictsState: LoadState.success,
          listDistricts: data.data,
        ),
      );
    } else {
      emit(state.copyWith(getListDistrictsState: LoadState.failure));
    }
  }

  FutureOr<void> _handelGetListWards(
    GetListWardsEvent event,
    Emitter<AddressState> emit,
  ) async {
    emit(state.copyWith(getListWardsState: LoadState.loading));
    final DataState<List<WardEntity>> data =
        await _addressUseCase.getListWards(districtId: event.idDistrict);

    if (data.isSuccess()) {
      emit(
        state.copyWith(
          getListWardsState: LoadState.success,
          listWards: data.data,
        ),
      );
    } else {
      emit(state.copyWith(getListDistrictsState: LoadState.failure));
    }
  }
}
