import 'dart:convert';

class UserModelMhsRiwayatRegistrasi {
  UserModelMhsRiwayatRegistrasi({
    required this.data,
  });

  final List<RiwayatRegistrasi>? data;

  factory UserModelMhsRiwayatRegistrasi.fromJson(String str) => UserModelMhsRiwayatRegistrasi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMhsRiwayatRegistrasi.fromMap(List json) => UserModelMhsRiwayatRegistrasi(
    data: json == null ? null : List<RiwayatRegistrasi>.from(json.map((x) => RiwayatRegistrasi.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class RiwayatRegistrasi {
  RiwayatRegistrasi({
    required this.semesterId,
    required this.semesterNama,
    required this.statusRegistrasi,
    required this.isIsiKrs,
    required this.isKrsDisetujui,
    required this.isRevisiKrs,
  });

  final String semesterId;
  final String semesterNama;
  final String statusRegistrasi;
  final int isIsiKrs;
  final String isKrsDisetujui;
  final String isRevisiKrs;

  factory RiwayatRegistrasi.fromJson(String str) => RiwayatRegistrasi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RiwayatRegistrasi.fromMap(Map<String, dynamic> json) => RiwayatRegistrasi(
    semesterId: json["semesterId"] == null ? null : json["semesterId"],
    semesterNama: json["semesterNama"] == null ? null : json["semesterNama"],
    statusRegistrasi: json["statusRegistrasi"] == null ? null : json["statusRegistrasi"],
    isIsiKrs: json["isIsiKrs"] == null ? null : json["isIsiKrs"],
    isKrsDisetujui: json["isKrsDisetujui"] == null ? null : json["isKrsDisetujui"],
    isRevisiKrs: json["isRevisiKrs"] == null ? null : json["isRevisiKrs"],
  );

  Map<String, dynamic> toMap() => {
    "semesterId": semesterId == null ? null : semesterId,
    "semesterNama": semesterNama == null ? null : semesterNama,
    "statusRegistrasi": statusRegistrasi == null ? null : statusRegistrasi,
    "isIsiKrs": isIsiKrs == null ? null : isIsiKrs,
    "isKrsDisetujui": isKrsDisetujui == null ? null : isKrsDisetujui,
    "isRevisiKrs": isRevisiKrs == null ? null : isRevisiKrs,
  };
}
