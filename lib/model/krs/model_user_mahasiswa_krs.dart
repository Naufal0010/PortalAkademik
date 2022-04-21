import 'dart:convert';

class UserModelMahasiswaKrs {
  UserModelMahasiswaKrs({
    required this.mkReguler,
    required this.mkKampusmerdeka,
    required this.ips,
    required this.sksMax,
  });

  final Mk? mkReguler;
  final Mk? mkKampusmerdeka;
  final String ips;
  final String sksMax;

  factory UserModelMahasiswaKrs.fromJson(String str) => UserModelMahasiswaKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaKrs.fromMap(Map<String, dynamic> json) => UserModelMahasiswaKrs(
    mkReguler: json["mk_reguler"] == null ? null : Mk.fromMap(json["mk_reguler"]),
    mkKampusmerdeka: json["mk_kampusmerdeka"] == null ? null : Mk.fromMap(json["mk_kampusmerdeka"]),
    ips: json["ips"] == null ? null : json["ips"],
    sksMax: json["sks_max"] == null ? null : json["sks_max"],
  );

  Map<String, dynamic> toMap() => {
    "mk_reguler": mkReguler == null ? null : mkReguler?.toMap(),
    "mk_kampusmerdeka": mkKampusmerdeka == null ? null : mkKampusmerdeka?.toMap(),
    "ips": ips == null ? null : ips,
    "sks_max": sksMax == null ? null : sksMax,
  };
}

class Mk {
  Mk({
    required this.krsListMk,
    required this.krsTotalSks,
  });

  final List<KrsListMk>? krsListMk;
  final int krsTotalSks;

  factory Mk.fromJson(String str) => Mk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mk.fromMap(Map<String, dynamic> json) => Mk(
    krsListMk: json["krs_list_mk"] == null ? null : List<KrsListMk>.from(json["krs_list_mk"].map((x) => KrsListMk.fromMap(x))),
    krsTotalSks: json["krs_total_sks"] == null ? null : json["krs_total_sks"],
  );

  Map<String, dynamic> toMap() => {
    "krs_list_mk": krsListMk == null ? null : List<dynamic>.from(krsListMk!.map((x) => x.toMap())),
    "krs_total_sks": krsTotalSks == null ? null : krsTotalSks,
  };
}

class KrsListMk {
  KrsListMk({
    required this.krsId,
    required this.krsIsSetuju,
    required this.krsIsKirim,
    required this.krsIsBatal,
    required this.krsIsRevisi,
    required this.krsIsBatalRevisi,
    required this.mkKode,
    required this.kurNama,
    required this.klsNama,
    required this.jenjang,
    required this.mkId,
    required this.mkNama,
    required this.mkSksTotal,
    required this.mkSksTeori,
    required this.mkSksPrak,
    required this.mkSksPrakLap,
    required this.klsJadwal,
    required this.klsId,
    required this.klsSemester,
    required this.klsIsMerdeka,
    required this.status,
    required this.statusKrs,
    required this.jadwal,
    required this.detail,
  });

  final String krsId;
  final String krsIsSetuju;
  final String krsIsKirim;
  final String krsIsBatal;
  final String krsIsRevisi;
  final dynamic krsIsBatalRevisi;
  final String mkKode;
  final String kurNama;
  final String klsNama;
  final String jenjang;
  final String mkId;
  final String mkNama;
  final String mkSksTotal;
  final String mkSksTeori;
  final String mkSksPrak;
  final String mkSksPrakLap;
  final String klsJadwal;
  final String klsId;
  final String klsSemester;
  final String klsIsMerdeka;
  final List<dynamic> status;
  final String statusKrs;
  final String jadwal;
  final Detail? detail;

  factory KrsListMk.fromJson(String str) => KrsListMk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KrsListMk.fromMap(Map<String, dynamic> json) => KrsListMk(
    krsId: json["krs_id"] == null ? null : json["krs_id"],
    krsIsSetuju: json["krs_isSetuju"] == null ? null : json["krs_isSetuju"],
    krsIsKirim: json["krs_isKirim"] == null ? null : json["krs_isKirim"],
    krsIsBatal: json["krs_isBatal"] == null ? null : json["krs_isBatal"],
    krsIsRevisi: json["krs_isRevisi"] == null ? null : json["krs_isRevisi"],
    krsIsBatalRevisi: json["krs_isBatalRevisi"],
    mkKode: json["mk_kode"] == null ? null : json["mk_kode"],
    kurNama: json["kur_nama"] == null ? null : json["kur_nama"],
    klsNama: json["kls_nama"] == null ? null : json["kls_nama"],
    jenjang: json["jenjang"] == null ? null : json["jenjang"],
    mkId: json["mk_id"] == null ? null : json["mk_id"],
    mkNama: json["mk_nama"] == null ? null : json["mk_nama"],
    mkSksTotal: json["mk_sks_total"] == null ? null : json["mk_sks_total"],
    mkSksTeori: json["mk_sks_teori"] == null ? null : json["mk_sks_teori"],
    mkSksPrak: json["mk_sks_prak"] == null ? null : json["mk_sks_prak"],
    mkSksPrakLap: json["mk_sks_prak_lap"] == null ? null : json["mk_sks_prak_lap"],
    klsJadwal: json["kls_jadwal"] == null ? null : json["kls_jadwal"],
    klsId: json["kls_id"] == null ? null : json["kls_id"],
    klsSemester: json["kls_semester"] == null ? null : json["kls_semester"],
    klsIsMerdeka: json["kls_isMerdeka"] == null ? null : json["kls_isMerdeka"],
    status: json["status"] == null ? null : json["status"],
    statusKrs: json["status_krs"] == null ? null : json["status_krs"],
    jadwal: json["jadwal"] == null ? null : json["jadwal"],
    detail: json["detail"] == null ? null : Detail.fromMap(json["detail"]),
  );

  Map<String, dynamic> toMap() => {
    "krs_id": krsId == null ? null : krsId,
    "krs_isSetuju": krsIsSetuju == null ? null : krsIsSetuju,
    "krs_isKirim": krsIsKirim == null ? null : krsIsKirim,
    "krs_isBatal": krsIsBatal == null ? null : krsIsBatal,
    "krs_isRevisi": krsIsRevisi == null ? null : krsIsRevisi,
    "krs_isBatalRevisi": krsIsBatalRevisi,
    "mk_kode": mkKode == null ? null : mkKode,
    "kur_nama": kurNama == null ? null : kurNama,
    "kls_nama": klsNama == null ? null : klsNama,
    "jenjang": jenjang == null ? null : jenjang,
    "mk_id": mkId == null ? null : mkId,
    "mk_nama": mkNama == null ? null : mkNama,
    "mk_sks_total": mkSksTotal == null ? null : mkSksTotal,
    "mk_sks_teori": mkSksTeori == null ? null : mkSksTeori,
    "mk_sks_prak": mkSksPrak == null ? null : mkSksPrak,
    "mk_sks_prak_lap": mkSksPrakLap == null ? null : mkSksPrakLap,
    "kls_jadwal": klsJadwal == null ? null : klsJadwal,
    "kls_id": klsId == null ? null : klsId,
    "kls_semester": klsSemester == null ? null : klsSemester,
    "kls_isMerdeka": klsIsMerdeka == null ? null : klsIsMerdeka,
    "status": status == null ? null : status,
    "status_krs": statusKrs == null ? null : statusKrs,
    "jadwal": jadwal == null ? null : jadwal,
    "detail": detail == null ? null : detail!.toMap(),
  };
}

class Detail {
  Detail({
    required this.dosenAmpu,
    required this.mkPrasyarat,
    required this.mkJumlahPeserta,
  });

  final List<DosenAmpu>? dosenAmpu;
  final List<MkPrasyarat>? mkPrasyarat;
  final String mkJumlahPeserta;

  String getDosenAmpu() {
    String dosen = '';
    dosenAmpu!.forEach((element) {dosen += '${element.nip} - ${element.nama}\n';  });
    return dosen;
  }

  factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
    dosenAmpu: json["dosen_ampu"] == null ? null : List<DosenAmpu>.from(json["dosen_ampu"].map((x) => DosenAmpu.fromMap(x))),
    mkPrasyarat: json["mk_prasyarat"] == null ? null : List<MkPrasyarat>.from(json["mk_prasyarat"].map((x) => MkPrasyarat.fromMap(x))),
    mkJumlahPeserta: json["mk_jumlahPeserta"] == null ? null : json["mk_jumlahPeserta"],
  );

  Map<String, dynamic> toMap() => {
    "dosen_ampu": dosenAmpu == null ? null : List<dynamic>.from(dosenAmpu!.map((x) => x.toMap())),
    "mk_prasyarat": mkPrasyarat == null ? null : List<dynamic>.from(mkPrasyarat!.map((x) => x.toMap())),
    "mk_jumlahPeserta": mkJumlahPeserta == null ? null : mkJumlahPeserta,
  };
}

class DosenAmpu {
  DosenAmpu({
    required this.nip,
    required this.nama,
    required this.prodi,
  });

  final String nip;
  final String nama;
  final String prodi;

  factory DosenAmpu.fromJson(String str) => DosenAmpu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DosenAmpu.fromMap(Map<String, dynamic> json) => DosenAmpu(
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

class MkPrasyarat {
  MkPrasyarat({
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

  factory MkPrasyarat.fromJson(String str) => MkPrasyarat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MkPrasyarat.fromMap(Map<String, dynamic> json) => MkPrasyarat(
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