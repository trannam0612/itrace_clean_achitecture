class SeaSonEntity {
  SeaSonEntity(
    this.id,
    this.name,
    this.status,
    this.companyId,
    this.description,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
  );

  final int? id;
  final String? name;
  final String? status;
  final int? companyId;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updateAt;
  final DateTime? deleteAt;
}
