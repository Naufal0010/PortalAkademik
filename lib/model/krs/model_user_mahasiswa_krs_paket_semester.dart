import 'dart:convert';

class ModelUserMahasiswaKrsPaket {
  ModelUserMahasiswaKrsPaket({
    required this.data,
  });

  final List<DataKrs>? data;

  factory ModelUserMahasiswaKrsPaket.fromJson(String str) => ModelUserMahasiswaKrsPaket.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUserMahasiswaKrsPaket.fromMap(List json) => ModelUserMahasiswaKrsPaket(
    data: json == null ? null : List<DataKrs>.from(json.map((x) => DataKrs.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataKrs {
  DataKrs({
    required this.idKls,
    required this.idMk,
    required this.kodeMk,
    required this.mk,
    required this.kls,
    required this.w,
    required this.kur,
    required this.semester,
    required this.sksTotal,
    required this.sksTeori,
    required this.sksPrak,
    required this.sksPrakLap,
    required this.syaratIpk,
    required this.syaratSks,
    required this.syaratSksPil,
    required this.status,
    required this.prodi,
    required this.jenjang,
    required this.isSudahAmbil,
    required this.detail,
  });

  final String idKls;
  final String idMk;
  final String kodeMk;
  final String mk;
  final String kls;
  final String w;
  final String kur;
  final String semester;
  final String sksTotal;
  final String sksTeori;
  final String sksPrak;
  final String sksPrakLap;
  final String syaratIpk;
  final String syaratSks;
  final String syaratSksPil;
  final String status;
  final String prodi;
  final String jenjang;
  final String isSudahAmbil;
  final DetailKrs? detail;

  factory DataKrs.fromJson(String str) => DataKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKrs.fromMap(Map<String, dynamic> json) => DataKrs(
    idKls: json["id_kls"] == null ? null : json["id_kls"],
    idMk: json["id_mk"] == null ? null : json["id_mk"],
    kodeMk: json["kode_mk"] == null ? null : json["kode_mk"],
    mk: json["mk"] == null ? null : json["mk"],
    kls: json["kls"] == null ? null : json["kls"],
    w: json["w"] == null ? null : json["w"],
    kur: json["kur"] == null ? null : json["kur"],
    semester: json["semester"] == null ? null : json["semester"],
    sksTotal: json["sks_total"] == null ? null : json["sks_total"],
    sksTeori: json["sks_teori"] == null ? null : json["sks_teori"],
    sksPrak: json["sks_prak"] == null ? null : json["sks_prak"],
    sksPrakLap: json["sks_prak_lap"] == null ? null : json["sks_prak_lap"],
    syaratIpk: json["syarat_ipk"] == null ? null : json["syarat_ipk"],
    syaratSks: json["syarat_sks"] == null ? null : json["syarat_sks"],
    syaratSksPil: json["syarat_sks_pil"] == null ? null : json["syarat_sks_pil"],
    status: json["status"] == null ? null : json["status"],
    prodi: json["prodi"] == null ? null : json["prodi"],
    jenjang: json["jenjang"] == null ? null : json["jenjang"],
    isSudahAmbil: json["is_sudah_ambil"] == null ? null : json["is_sudah_ambil"],
    detail: json["detail"] == null ? null : DetailKrs.fromMap(json["detail"]),
  );

  Map<String, dynamic> toMap() => {
    "id_kls": idKls == null ? null : idKls,
    "id_mk": idMk == null ? null : idMk,
    "kode_mk": kodeMk == null ? null : kodeMk,
    "mk": mk == null ? null : mk,
    "kls": kls == null ? null : kls,
    "w": w == null ? null : w,
    "kur": kur == null ? null : kur,
    "semester": semester == null ? null : semester,
    "sks_total": sksTotal == null ? null : sksTotal,
    "sks_teori": sksTeori == null ? null : sksTeori,
    "sks_prak": sksPrak == null ? null : sksPrak,
    "sks_prak_lap": sksPrakLap == null ? null : sksPrakLap,
    "syarat_ipk": syaratIpk == null ? null : syaratIpk,
    "syarat_sks": syaratSks == null ? null : syaratSks,
    "syarat_sks_pil": syaratSksPil == null ? null : syaratSksPil,
    "status": status == null ? null : status,
    "prodi": prodi == null ? null : prodi,
    "jenjang": jenjang == null ? null : jenjang,
    "is_sudah_ambil": isSudahAmbil == null ? null : isSudahAmbil,
    "detail": detail == null ? null : detail!.toMap(),
  };
}

class DetailKrs {
  DetailKrs({
    required this.dosenAmpu,
    required this.mkPrasyarat,
    required this.mkJumlahPeserta,
  });

  final List<DosenAmpuKrs>? dosenAmpu;
  final List<MkPrasyaratKrs>? mkPrasyarat;
  final String mkJumlahPeserta;

  factory DetailKrs.fromJson(String str) => DetailKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DetailKrs.fromMap(Map<String, dynamic> json) => DetailKrs(
    dosenAmpu: json["dosen_ampu"] == null ? null : List<DosenAmpuKrs>.from(json["dosen_ampu"].map((x) => DosenAmpuKrs.fromMap(x))),
    mkPrasyarat: json["mk_prasyarat"] == null ? null : List<MkPrasyaratKrs>.from(json["mk_prasyarat"].map((x) => MkPrasyaratKrs.fromMap(x))),
    mkJumlahPeserta: json["mk_jumlahPeserta"] == null ? null : json["mk_jumlahPeserta"],
  );

  Map<String, dynamic> toMap() => {
    "dosen_ampu": dosenAmpu == null ? null : List<dynamic>.from(dosenAmpu!.map((x) => x.toMap())),
    "mk_prasyarat": mkPrasyarat == null ? null : List<dynamic>.from(mkPrasyarat!.map((x) => x.toMap())),
    "mk_jumlahPeserta": mkJumlahPeserta == null ? null : mkJumlahPeserta,
  };
}

class DosenAmpuKrs {
  DosenAmpuKrs({
    required this.nip,
    required this.nama,
    required this.prodi,
  });

  final String nip;
  final String nama;
  final String prodi;

  factory DosenAmpuKrs.fromJson(String str) => DosenAmpuKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenAmpuKrs.fromMap(Map<String, dynamic> json) => DosenAmpuKrs(
    nip: json["nip"] == null ? null : json["nip"],
    nama: json["nama"] == null ? null : json["nama"],
    prodi: json["prodi"] == null ? null : json["prodi"],
  );

  Map<String, dynamic> toMap() => {
    "nip": nip == null ? null : nip,
    "nama": nama == null ? null : nama,
    "prodi": prodi == null ? null : prodi,
  };
}

class MkPrasyaratKrs {
  MkPrasyaratKrs({
    required this.id,
    required this.kode,
    required this.nama,
    required this.syaratKode,
    required this.syarat,
    required this.bobot,
  });

  final String id;
  final String kode;
  final String nama;
  final String syaratKode;
  final String syarat;
  final String bobot;

  factory MkPrasyaratKrs.fromJson(String str) => MkPrasyaratKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MkPrasyaratKrs.fromMap(Map<String, dynamic> json) => MkPrasyaratKrs(
    id: json["id"] == null ? null : json["id"],
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    syaratKode: json["syarat_kode"] == null ? null : json["syarat_kode"],
    syarat: json["syarat"] == null ? null : json["syarat"],
    bobot: json["bobot"] == null ? null : json["bobot"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "syarat_kode": syaratKode == null ? null : syaratKode,
    "syarat": syarat == null ? null : syarat,
    "bobot": bobot == null ? null : bobot,
  };
}
