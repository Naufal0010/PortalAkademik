import 'dart:convert';

class UserKhsSemesterMahasiswa {
  UserKhsSemesterMahasiswa({
    required this.data,
  });

  final List<Datum>? data;

  factory UserKhsSemesterMahasiswa.fromJson(String str) => UserKhsSemesterMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserKhsSemesterMahasiswa.fromMap(List json) => UserKhsSemesterMahasiswa(
    data: json == null ? null : List<Datum>.from(json.map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class Datum {
  Datum({
    required this.semId,
    required this.semTahun,
    required this.semNama,
    required this.semAktif,
  });

  final String semId;
  final String? semTahun;
  final String? semNama;
  final String? semAktif;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    semId: json["semId"] == null ? null : json["semId"],
    semTahun: json["semTahun"] == null ? null : json["semTahun"],
    semNama: json["semNama"] == null ? null : json["semNama"],
    semAktif: json["semAktif"] == null ? null : json["semAktif"],
  );

  Map<String, dynamic> toMap() => {
    "semId": semId == null ? null : semId,
    "semTahun": semTahun == null ? null : semTahun,
    "semNama": semNama == null ? null : semNama,
    "semAktif": semAktif == null ? null : semAktif,
  };
}