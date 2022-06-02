import 'dart:convert';

class ModelUserPembiayaanKuliah {
  ModelUserPembiayaanKuliah({
    required this.rows,
  });

  final List<Row>? rows;

  factory ModelUserPembiayaanKuliah.fromJson(String str) =>
      ModelUserPembiayaanKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUserPembiayaanKuliah.fromMap(Map<String, dynamic> json) =>
      ModelUserPembiayaanKuliah(
        rows: json["rows"] == null
            ? null
            : List<Row>.from(json["rows"].map((x) => Row.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toMap())),
      };
}

class Row {
  Row({
    required this.kode,
    required this.nama,
  });

  final String kode;
  final String nama;

  factory Row.fromJson(String str) => Row.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Row.fromMap(Map<String, dynamic> json) => Row(
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
      };
}
