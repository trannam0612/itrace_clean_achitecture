part of 'app_bloc.dart';

class AppState {
  AppState({this.updatedUserInfoState, this.userEntity});

  final LoadState? updatedUserInfoState;
  final UserEntity? userEntity;

  AppState copyWith({LoadState? updatedUserInfoState, UserEntity? userEntity}) {
    return AppState(
      updatedUserInfoState: updatedUserInfoState ?? this.updatedUserInfoState,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
