import 'dart:convert';

class UserKhsSemesterMahasiswa {
  UserKhsSemesterMahasiswa({
    required this.data,
  });

  final List<KhsSemester>? data;

  factory UserKhsSemesterMahasiswa.fromJson(String str) => UserKhsSemesterMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserKhsSemesterMahasiswa.fromMap(List json) => UserKhsSemesterMahasiswa(
    data: json == null ? null : List<KhsSemester>.from(json.map((x) => KhsSemester.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class KhsSemester {
  KhsSemester({
    required this.semId,
    required this.semTahun,
    required this.semNama,
    required this.semAktif,
  });

  final String semId;
  final String? semTahun;
  final String? semNama;
  final String? semAktif;

  factory KhsSemester.fromJson(String str) => KhsSemester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KhsSemester.fromMap(Map<String, dynamic> json) => KhsSemester(
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