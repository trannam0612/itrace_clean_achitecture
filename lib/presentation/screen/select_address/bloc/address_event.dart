part of 'address_bloc.dart';

class AddressEvent {}

class GetListProvincesEvent extends AddressEvent {}

class GetListDistrictsEvent extends AddressEvent {
  GetListDistrictsEvent(this.idProvince);

  final String idProvince;
}

class GetListWardsEvent extends AddressEvent {
  GetListWardsEvent(this.idDistrict);

  final String idDistrict;
}
