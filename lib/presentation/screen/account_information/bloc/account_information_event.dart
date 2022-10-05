part of 'account_information_bloc.dart';

class AccountInformationEvent {}

class UpdateUserInfoEvent extends AccountInformationEvent {
  UpdateUserInfoEvent({
    required this.name,
    required this.phone,
    this.email,
    required this.provinceId,
    required this.districtId,
    required this.wardId,
    required this.address,
    this.avatar,
  });

  final String name;
  final String phone;
  final String? email;
  final String provinceId;
  final String districtId;
  final String wardId;
  final String address;
  final File? avatar;
}
