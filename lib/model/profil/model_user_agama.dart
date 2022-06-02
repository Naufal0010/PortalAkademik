import 'dart:convert';

class ModelUserAgama {
  ModelUserAgama({
    required this.rows,
  });

  final List<Row>? rows;

  factory ModelUserAgama.fromJson(String str) => ModelUserAgama.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUserAgama.fromMap(Map<String, dynamic> json) => ModelUserAgama(
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
    required this.idFeeder,
    required this.createdAt,
    required this.updatedAt,
  });

  final String kode;
  final String nama;
  final String idFeeder;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Row.fromJson(String str) => Row.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Row.fromMap(Map<String, dynamic> json) => Row(
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    idFeeder: json["idFeeder"] == null ? null : json["idFeeder"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "idFeeder": idFeeder == null ? null : idFeeder,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
