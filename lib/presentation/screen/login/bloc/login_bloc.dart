import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_item.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_sevice.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/entities/login_entity.dart';
import 'package:itrace_247/domain/repositories/login_reposetory.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginRepository, this._storageService) : super(LoginState()) {
    on<ConfirmPinCodeEvent>(
      _handleConfirmPinCode,
    );
    on<ClearStateEvent>(
      _handleClearState,
    );
    on<ValidateTokenEvent>(
      _handleValidateToken,
    );
  }

  final LoginRepository _loginRepository;
  final StorageService _storageService;

  FutureOr<void> _handleConfirmPinCode(
    ConfirmPinCodeEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState(loginState: LoadState.loading));
    final DataState<LoginEntity> data =
        await _loginRepository.login(pinCode: event.pinCode);

    if (data.isSuccess()) {
      emit(
        state.copyWith(
          loginState: LoadState.success,
          message: data.data?.loginData?.token??''
        ),
      );
      final String tokenUser = data.data?.loginData?.token ?? '';
      _storageService.writeSecureData(StorageItem('token', tokenUser));
    } else {
      emit(
        state.copyWith(
          loginState: LoadState.failure,
          message: data.data?.message ?? "",
        ),
      );
    }
  }

  FutureOr<void> _handleClearState(
    ClearStateEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.clearState());
  }

  FutureOr<void> _handleValidateToken(
    ValidateTokenEvent event,
    Emitter<LoginState> emit,
  ) async {
    String? currentToken = await _storageService.readSecureData('token');

    log('currentToken:${currentToken}');
    log('currentToken:${currentToken?.isNotEmpty == true}');
    log('currentToken:${currentToken != null}');
    if (currentToken?.isNotEmpty == true || currentToken != null) {
      emit(
        state.copyWith(
          validateTokenState: LoadState.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          validateTokenState: LoadState.failure,
        ),
      );
    }
  }
}
