import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/shared_preferences/shared_preferences_sevice.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/data/datasource/remote/models/request/update_info_user_request.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:itrace_247/domain/usecases/user_usecase.dart';
import 'package:itrace_247/presentation/bloc/app_bloc.dart';

part 'account_information_event.dart';
part 'account_information_state.dart';

class AccountInformationBloc
    extends Bloc<AccountInformationEvent, AccountInformationState> {
  AccountInformationBloc(
      this._userUsecase, this._localStorageService, this._appBloc)
      : super(AccountInformationState()) {
    on<UpdateUserInfoEvent>(
      _handleUpdateUserInfo,
    );
  }
  final UserUsecase _userUsecase;
  final LocalStorageService _localStorageService;
  final AppBloc _appBloc;

  FutureOr<void> _handleUpdateUserInfo(
    UpdateUserInfoEvent event,
    Emitter<AccountInformationState> emit,
  ) async {
    emit(state.copyWith(updateUserInfoState: LoadState.loading));
    UpdateUserInfoRequest updateUserInfoRequest = UpdateUserInfoRequest(
      name: event.name,
      email: event.email,
      phone: event.phone,
      provinceId: event.provinceId,
      districtId: event.districtId,
      wardId: event.wardId,
      address: event.address,
    );
    final DataState<UserEntity> dataState = await _userUsecase.updateUserInfo(
      name: event.name,
      phone: event.phone,
      email: event.email,
      provinceId: event.provinceId,
      districtId: event.districtId,
      wardId: event.wardId,
      address: event.address,
      avatar: event.avatar,
    );
    log('dataState:${dataState.data?.name}');
    if (dataState.isSuccess()) {
      emit(state.copyWith(updateUserInfoState: LoadState.success));
      final UserEntity? userEntity = dataState.data;
      _localStorageService.saveToDisk(
        'user',
        jsonEncode(userEntity),
      );

      final user = _localStorageService.getFromDisk('user');
      _appBloc.add(UpdatedUserInfoEvent());
      log('_localStorageService: $user');
    } else {
      emit(state.copyWith(updateUserInfoState: LoadState.failure));
    }
  }
}
