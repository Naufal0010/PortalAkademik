import 'dart:convert';

class UserMhsJadwalMataKuliah {
  UserMhsJadwalMataKuliah({
    required this.data,
  });
  final List<MataKuliah>? data;

  factory UserMhsJadwalMataKuliah.fromJson(String str) =>
      UserMhsJadwalMataKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMhsJadwalMataKuliah.fromMap(List json) =>
      UserMhsJadwalMataKuliah(
        data: json == null
            ? null
            : List<MataKuliah>.from(json.map((x) => MataKuliah.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class MataKuliah {
  MataKuliah({
    required this.idKelas,
    required this.mk,
    required this.linkZoom,
    required this.dosen,
    required this.hariKuliah,
    required this.jamKuliah,
    required this.ruangKuliah,
    required this.hariUas,
    required this.jamUas,
    required this.ruangUas,
    required this.urut2,
    required this.urut,
  });

  final String idKelas;
  final String mk;
  final dynamic linkZoom;
  final String dosen;
  final String hariKuliah;
  final String jamKuliah;
  final String ruangKuliah;
  final DateTime? hariUas;
  final String jamUas;
  final String ruangUas;
  final int urut2;
  final int urut;

  factory MataKuliah.fromJson(String str) => MataKuliah.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MataKuliah.fromMap(Map<String, dynamic> json) => MataKuliah(
        idKelas: json["id_kelas"] == null ? null : json["id_kelas"],
        mk: json["mk"] == null ? null : json["mk"],
        linkZoom: json["link_zoom"],
        dosen: json["dosen"] == null ? null : json["dosen"],
        hariKuliah: json["hari_kuliah"] == null ? null : json["hari_kuliah"],
        jamKuliah: json["jam_kuliah"] == null ? null : json["jam_kuliah"],
        ruangKuliah: json["ruang_kuliah"] == null ? null : json["ruang_kuliah"],
        hariUas:
            json["hari_uas"] == null ? null : DateTime.parse(json["hari_uas"]),
        jamUas: json["jam_uas"] == null ? null : json["jam_uas"],
        ruangUas: json["ruang_uas"] == null ? null : json["ruang_uas"],
        urut2: json["urut2"] == null ? null : json["urut2"],
        urut: json["urut"] == null ? null : json["urut"],
      );

  Map<String, dynamic> toMap() => {
        "id_kelas": idKelas == null ? null : idKelas,
        "mk": mk == null ? null : mk,
        "link_zoom": linkZoom,
        "dosen": dosen == null ? null : dosen,
        "hari_kuliah": hariKuliah == null ? null : hariKuliah,
        "jam_kuliah": jamKuliah == null ? null : jamKuliah,
        "ruang_kuliah": ruangKuliah == null ? null : ruangKuliah,
        "hari_uas": hariUas == null
            ? null
            : "${hariUas?.year.toString().padLeft(4, '0')}-${hariUas?.month.toString().padLeft(2, '0')}-${hariUas?.day.toString().padLeft(2, '0')}",
        "jam_uas": jamUas == null ? null : jamUas,
        "ruang_uas": ruangUas == null ? null : ruangUas,
        "urut2": urut2 == null ? null : urut2,
        "urut": urut == null ? null : urut,
      };
}