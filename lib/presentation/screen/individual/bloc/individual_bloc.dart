import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/core/resource/data_state.dart';
import 'package:itrace_247/domain/repositories/user_reposetory.dart';
import 'package:itrace_247/domain/usecases/user_usecase.dart';
import 'package:meta/meta.dart';

part 'individual_event.dart';
part 'individual_state.dart';

class IndividualBloc extends Bloc<IndividualEvent, IndividualState> {
  IndividualBloc(this._userUsecase) : super(IndividualState()) {
    on<GetInfoUserEvent>(
      _handleGetInfoUser,
    );
  }
  final UserUsecase _userUsecase;

  FutureOr<void> _handleGetInfoUser(
    GetInfoUserEvent event,
    Emitter<IndividualState> emit,
  ) async {
    emit(state.copyWith(getUserInforState: LoadState.loading));
    log('_handleGetInfoUser');

    final DataState<UserEntity> data = await _userUsecase.getUserInfo();

    log('province123:${data.data?.province?.id}');

    if (data.isSuccess()) {
      emit(
        state.copyWith(
          getUserInforState: LoadState.success,
          userEntity: data.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          getUserInforState: LoadState.failure,
        ),
      );
    }
  }
}
