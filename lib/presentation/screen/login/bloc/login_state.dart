part of 'login_bloc.dart';

class LoginState {
  LoginState({this.loginState, this.message, this.validateTokenState});

  final LoadState? loginState;
  final String? message;
  final LoadState? validateTokenState;

  LoginState copyWith({
    LoadState? loginState,
    String? message,
    LoadState? validateTokenState = LoadState.failure,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
      message: message ?? this.message,
      validateTokenState: validateTokenState ?? this.validateTokenState,
    );
  }

  LoginState clearState() {
    return LoginState();
  }
}
