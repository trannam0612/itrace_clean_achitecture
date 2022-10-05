part of 'account_information_bloc.dart';

class AccountInformationState {
  AccountInformationState({this.updateUserInfoState});

  final LoadState? updateUserInfoState;

  AccountInformationState copyWith({LoadState? updateUserInfoState}) {
    return AccountInformationState(
      updateUserInfoState: updateUserInfoState ?? this.updateUserInfoState,
    );
  }
}
