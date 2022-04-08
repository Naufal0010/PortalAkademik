import 'dart:convert';

class UserModelMahasiswaJadwalUas {
  UserModelMahasiswaJadwalUas({
    required this.data,
  });

  final List<Datum>? data;

  factory UserModelMahasiswaJadwalUas.fromJson(String str) =>
      UserModelMahasiswaJadwalUas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaJadwalUas.fromMap(Map<String, dynamic> json) =>
      UserModelMahasiswaJadwalUas(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.idKelas,
    required this.mk,
    required this.hariUas,
    required this.jamUas,
    required this.ruangUas,
  });

  final String idKelas;
  final String mk;
  final String hariUas;
  final String jamUas;
  final String ruangUas;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        idKelas: json["id_kelas"] == null ? null : json["id_kelas"],
        mk: json["mk"] == null ? null : json["mk"],
        hariUas: json["hari_uas"] == null ? null : json["hari_uas"],
        jamUas: json["jam_uas"] == null ? null : json["jam_uas"],
        ruangUas: json["ruang_uas"] == null ? null : json["ruang_uas"],
      );

  Map<String, dynamic> toMap() => {
        "id_kelas": idKelas == null ? null : idKelas,
        "mk": mk == null ? null : mk,
        "hari_uas": hariUas == null ? null : hariUas,
        "jam_uas": jamUas == null ? null : jamUas,
        "ruang_uas": ruangUas == null ? null : ruangUas,
      };
}
