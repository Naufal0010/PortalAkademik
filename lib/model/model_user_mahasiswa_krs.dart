import 'dart:convert';

class UserModelRencanaHasilStudi {
  UserModelRencanaHasilStudi({
    required this.mkReguler,
    required this.mkKampusmerdeka,
    required this.ips,
    required this.sksMax,
  });

  final MkReguler? mkReguler;
  final MkKampusmerdeka? mkKampusmerdeka;
  final String ips;
  final int sksMax;

  factory UserModelRencanaHasilStudi.fromJson(String str) => UserModelRencanaHasilStudi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelRencanaHasilStudi.fromMap(Map<String, dynamic> json) => UserModelRencanaHasilStudi(
    mkReguler: json["mk_reguler"] == null ? null : MkReguler.fromMap(json["mk_reguler"]),
    mkKampusmerdeka: json["mk_kampusmerdeka"] == null ? null : MkKampusmerdeka.fromMap(json["mk_kampusmerdeka"]),
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

class MkKampusmerdeka {
  MkKampusmerdeka({
    required this.krsListMk,
    required this.krsTotalSks,
  });

  final List<dynamic>? krsListMk;
  final int krsTotalSks;

  factory MkKampusmerdeka.fromJson(String str) => MkKampusmerdeka.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MkKampusmerdeka.fromMap(Map<String, dynamic> json) => MkKampusmerdeka(
    krsListMk: json["krs_list_mk"] == null ? null : List<dynamic>.from(json["krs_list_mk"].map((x) => x)),
    krsTotalSks: json["krs_total_sks"] == null ? null : json["krs_total_sks"],
  );

  Map<String, dynamic> toMap() => {
    "krs_list_mk": krsListMk == null ? null : List<dynamic>.from(krsListMk!.map((x) => x)),
    "krs_total_sks": krsTotalSks == null ? null : krsTotalSks,
  };
}

class MkReguler {
  MkReguler({
    required this.krsListMk,
    required this.krsTotalSks,
  });

  final Map<String, KrsListMk>? krsListMk;
  final int krsTotalSks;

  factory MkReguler.fromJson(String str) => MkReguler.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MkReguler.fromMap(Map<String, dynamic> json) => MkReguler(
    krsListMk: json["krs_list_mk"] == null ? null : Map.from(json["krs_list_mk"]).map((k, v) => MapEntry<String, KrsListMk>(k, KrsListMk.fromMap(v))),
    krsTotalSks: json["krs_total_sks"] == null ? null : json["krs_total_sks"],
  );

  Map<String, dynamic> toMap() => {
    "krs_list_mk": krsListMk == null ? null : Map.from(krsListMk!).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
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
  final List<String>? status;
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
    status: json["status"] == null ? null : List<String>.from(json["status"]),
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
    "status": status == null ? null : List<String>.from(status!.map((x) => x)),
    "status_krs": statusKrs == null ? null : statusKrs,
    "jadwal": jadwal == null ? null : jadwal,
    "detail": detail == null ? null : detail?.toMap(),
  };
}

class Detail {
  Detail({
    required this.dosenAmpu,
    required this.mkPrasyarat,
    required this.mkJumlahPeserta,
  });

  final List<DosenAmpu>? dosenAmpu;
  final List<dynamic>? mkPrasyarat;
  final String mkJumlahPeserta;

  factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
    dosenAmpu: json["dosen_ampu"] == null ? null : List<DosenAmpu>.from(json["dosen_ampu"].map((x) => DosenAmpu.fromMap(x))),
    mkPrasyarat: json["mk_prasyarat"] == null ? null : List<dynamic>.from(json["mk_prasyarat"].map((x) => x)),
    mkJumlahPeserta: json["mk_jumlahPeserta"] == null ? null : json["mk_jumlahPeserta"],
  );

  Map<String, dynamic> toMap() => {
    "dosen_ampu": dosenAmpu == null ? null : List<dynamic>.from(dosenAmpu!.map((x) => x.toMap())),
    "mk_prasyarat": mkPrasyarat == null ? null : List<dynamic>.from(mkPrasyarat!.map((x) => x)),
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
