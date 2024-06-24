class UnitModel {
  final int? id;
  final String? name;

  UnitModel({this.id, this.name});

  factory UnitModel.fromMap(Map<String, dynamic> map) {
    return UnitModel(
      id: map['units_id'],
      name: map['units_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'units_id': id,
      'units_name': name,
    };
  }

  UnitModel copyWith({
    int? id,
    String? name,
  }) {
    return UnitModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
