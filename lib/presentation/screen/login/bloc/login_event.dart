part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class ConfirmPinCodeEvent extends LoginEvent {
  ConfirmPinCodeEvent({required this.pinCode});

  final String pinCode;
}

class ClearStateEvent extends LoginEvent {
  ClearStateEvent();
}

class ValidateTokenEvent extends LoginEvent {
  ValidateTokenEvent();
}
