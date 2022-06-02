import 'dart:convert';

class ModelUserStatusNikah {
  ModelUserStatusNikah({
    required this.rows,
  });

  final List<Row>? rows;

  factory ModelUserStatusNikah.fromJson(String str) => ModelUserStatusNikah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUserStatusNikah.fromMap(Map<String, dynamic> json) => ModelUserStatusNikah(
    rows: json["rows"] == null ? null : List<Row>.from(json["rows"].map((x) => Row.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "rows": rows == null ? null : List<dynamic>.from(rows!.map((x) => x.toMap())),
  };
}

class Row {
  Row({
    required this.kode,
    required this.nama,
    required this.createdAt,
    required this.updatedAt,
  });

  final String kode;
  final String nama;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Row.fromJson(String str) => Row.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Row.fromMap(Map<String, dynamic> json) => Row(
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
