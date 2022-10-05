part of 'individual_bloc.dart';

class IndividualState {
  IndividualState({
    this.getUserInforState,
    this.userEntity,
  });

  final LoadState? getUserInforState;
  final UserEntity? userEntity;

  IndividualState copyWith({
    LoadState? getUserInforState,
    UserEntity? userEntity,
  }) {
    return IndividualState(
      getUserInforState: getUserInforState ?? this.getUserInforState,
      userEntity: userEntity ?? this.userEntity,
    );
  }

  IndividualState clearState() {
    return IndividualState();
  }
}
