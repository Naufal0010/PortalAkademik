import 'dart:convert';

class UserModelMahasiswaDataDetailKuesioner {
  UserModelMahasiswaDataDetailKuesioner({
    required this.dosenKelas,
    required this.kuesioner,
  });

  final List<DosenKelas>? dosenKelas;
  final List<DataKuesioner>? kuesioner;

  factory UserModelMahasiswaDataDetailKuesioner.fromJson(String str) => UserModelMahasiswaDataDetailKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaDataDetailKuesioner.fromMap(Map<String, dynamic> json) => UserModelMahasiswaDataDetailKuesioner(
    dosenKelas: json["dosenKelas"] == null ? null : List<DosenKelas>.from(json["dosenKelas"].map((x) => DosenKelas.fromMap(x))),
    kuesioner: json["kuesioner"] == null ? null : List<DataKuesioner>.from(json["kuesioner"].map((x) => DataKuesioner.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "dosenKelas": dosenKelas == null ? null : List<dynamic>.from(dosenKelas!.map((x) => x.toMap())),
    "kuesioner": kuesioner == null ? null : List<dynamic>.from(kuesioner!.map((x) => x.toMap())),
  };
}

class DosenKelas {
  DosenKelas({
    required this.klsId,
    required this.nip,
    required this.dosenKe,
    required this.isBolehInput,
    required this.dosen,
  });

  final String klsId;
  final String nip;
  final String dosenKe;
  final String isBolehInput;
  final DataDosen? dosen;

  factory DosenKelas.fromJson(String str) => DosenKelas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenKelas.fromMap(Map<String, dynamic> json) => DosenKelas(
    klsId: json["klsId"] == null ? null : json["klsId"],
    nip: json["nip"] == null ? null : json["nip"],
    dosenKe: json["dosenKe"] == null ? null : json["dosenKe"],
    isBolehInput: json["isBolehInput"] == null ? null : json["isBolehInput"],
    dosen: json["dosen"] == null ? null : DataDosen.fromMap(json["dosen"]),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "nip": nip == null ? null : nip,
    "dosenKe": dosenKe == null ? null : dosenKe,
    "isBolehInput": isBolehInput == null ? null : isBolehInput,
    "dosen": dosen == null ? null : dosen?.toMap(),
  };
}

class DataDosen {
  DataDosen({
    required this.nama,
    required this.nidn,
  });

  final String nama;
  final String nidn;

  factory DataDosen.fromJson(String str) => DataDosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataDosen.fromMap(Map<String, dynamic> json) => DataDosen(
    nama: json["nama"] == null ? null : json["nama"],
    nidn: json["nidn"] == null ? null : json["nidn"],
  );

  Map<String, dynamic> toMap() => {
    "nama": nama == null ? null : nama,
    "nidn": nidn == null ? null : nidn,
  };
}

class DataKuesioner {
  DataKuesioner({
    required this.idSoal,
    required this.soal,
    required this.status,
    required this.jenis,
    required this.createdAt,
    required this.updatedAt,
  });

  final String idSoal;
  final String soal;
  final String status;
  final String jenis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataKuesioner.fromJson(String str) => DataKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKuesioner.fromMap(Map<String, dynamic> json) => DataKuesioner(
    idSoal: json["id_soal"] == null ? null : json["id_soal"],
    soal: json["soal"] == null ? null : json["soal"],
    status: json["status"] == null ? null : json["status"],
    jenis: json["jenis"] == null ? null : json["jenis"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "id_soal": idSoal == null ? null : idSoal,
    "soal": soal == null ? null : soal,
    "status": status == null ? null : status,
    "jenis": jenis == null ? null : jenis,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
