import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:itrace_247/config/shared_preferences/shared_preferences_sevice.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._localStorageService) : super(AppState()) {
    on<UpdatedUserInfoEvent>(
      _handleUpdatedUserInfo,
    );
  }
  final LocalStorageService _localStorageService;

  FutureOr<void> _handleUpdatedUserInfo(
    UpdatedUserInfoEvent event,
    Emitter<AppState> emit,
  ) {
    var user = _localStorageService.getFromDisk('user');

    Map<String, dynamic> userMap =
        jsonDecode(user as String) as Map<String, dynamic>;

    UserEntity a = UserEntity.fromJson(userMap);

    log('appBloc:${jsonEncode(a)}');
    emit(
      state.copyWith(
        updatedUserInfoState: LoadState.success,
        userEntity: a,
      ),
    );
  }
}
