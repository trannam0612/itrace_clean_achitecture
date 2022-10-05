class AddressModel {
  AddressModel({
    this.id,
    this.name,
    this.selected = false,
  });

  final int? id;
  final String? name;
  bool? selected;
}
