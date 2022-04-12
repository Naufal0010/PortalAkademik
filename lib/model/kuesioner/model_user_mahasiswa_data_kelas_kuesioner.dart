import 'dart:convert';

class UserModelMahasiswaDataKelasKuesioner {
  UserModelMahasiswaDataKelasKuesioner({
    required this.semester,
    required this.kelas,
  });

  final String semester;
  final List<KelasMahasiswa>? kelas;

  factory UserModelMahasiswaDataKelasKuesioner.fromJson(String str) => UserModelMahasiswaDataKelasKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaDataKelasKuesioner.fromMap(Map<String, dynamic> json) => UserModelMahasiswaDataKelasKuesioner(
    semester: json["semester"] == null ? null : json["semester"],
    kelas: json["kelas"] == null ? null : List<KelasMahasiswa>.from(json["kelas"].map((x) => KelasMahasiswa.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "semester": semester == null ? null : semester,
    "kelas": kelas == null ? null : List<dynamic>.from(kelas!.map((x) => x.toMap())),
  };
}

class KelasMahasiswa {
  KelasMahasiswa({
    required this.klsId,
    required this.krsdtId,
    required this.krsId,
    required this.krsMhsNiu,
    required this.krsSemId,
    required this.mkkurNamaResmi,
    required this.mkkurKode,
    required this.klsNama,
    required this.sks,
    required this.isMengisiKuesioner,
    required this.dosenAmpu,
  });

  final String klsId;
  final String krsdtId;
  final String krsId;
  final String krsMhsNiu;
  final String krsSemId;
  final String mkkurNamaResmi;
  final String mkkurKode;
  final String klsNama;
  final String sks;
  final String isMengisiKuesioner;
  final List<DosenPengampu>? dosenAmpu;

  factory KelasMahasiswa.fromJson(String str) => KelasMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KelasMahasiswa.fromMap(Map<String, dynamic> json) => KelasMahasiswa(
    klsId: json["klsId"] == null ? null : json["klsId"],
    krsdtId: json["krsdtId"] == null ? null : json["krsdtId"],
    krsId: json["krsId"] == null ? null : json["krsId"],
    krsMhsNiu: json["krsMhsNiu"] == null ? null : json["krsMhsNiu"],
    krsSemId: json["krsSemId"] == null ? null : json["krsSemId"],
    mkkurNamaResmi: json["mkkurNamaResmi"] == null ? null : json["mkkurNamaResmi"],
    mkkurKode: json["mkkurKode"] == null ? null : json["mkkurKode"],
    klsNama: json["klsNama"] == null ? null : json["klsNama"],
    sks: json["sks"] == null ? null : json["sks"],
    isMengisiKuesioner: json["isMengisiKuesioner"] == null ? null : json["isMengisiKuesioner"],
    dosenAmpu: json["dosenAmpu"] == null ? null : List<DosenPengampu>.from(json["dosenAmpu"].map((x) => DosenPengampu.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "krsdtId": krsdtId == null ? null : krsdtId,
    "krsId": krsId == null ? null : krsId,
    "krsMhsNiu": krsMhsNiu == null ? null : krsMhsNiu,
    "krsSemId": krsSemId == null ? null : krsSemId,
    "mkkurNamaResmi": mkkurNamaResmi == null ? null : mkkurNamaResmi,
    "mkkurKode": mkkurKode == null ? null : mkkurKode,
    "klsNama": klsNama == null ? null : klsNama,
    "sks": sks == null ? null : sks,
    "isMengisiKuesioner": isMengisiKuesioner == null ? null : isMengisiKuesioner,
    "dosenAmpu": dosenAmpu == null ? null : List<dynamic>.from(dosenAmpu!.map((x) => x.toMap())),
  };
}

class DosenPengampu {
  DosenPengampu({
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
  final Dosen? dosen;

  factory DosenPengampu.fromJson(String str) => DosenPengampu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenPengampu.fromMap(Map<String, dynamic> json) => DosenPengampu(
    klsId: json["klsId"] == null ? null : json["klsId"],
    nip: json["nip"] == null ? null : json["nip"],
    dosenKe: json["dosenKe"] == null ? null : json["dosenKe"],
    isBolehInput: json["isBolehInput"] == null ? null : json["isBolehInput"],
    dosen: json["dosen"] == null ? null : Dosen.fromMap(json["dosen"]),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "nip": nip == null ? null : nip,
    "dosenKe": dosenKe == null ? null : dosenKe,
    "isBolehInput": isBolehInput == null ? null : isBolehInput,
    "dosen": dosen == null ? null : dosen?.toMap(),
  };
}

class Dosen {
  Dosen({
    required this.nama,
    required this.nidn,
  });

  final String nama;
  final String nidn;

  factory Dosen.fromJson(String str) => Dosen.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dosen.fromMap(Map<String, dynamic> json) => Dosen(
    nama: json["nama"] == null ? null : json["nama"],
    nidn: json["nidn"] == null ? null : json["nidn"],
  );

  Map<String, dynamic> toMap() => {
    "nama": nama == null ? null : nama,
    "nidn": nidn == null ? null : nidn,
  };
}