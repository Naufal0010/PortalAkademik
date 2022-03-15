import 'dart:convert';

class UserKhsMahasiswa {
  UserKhsMahasiswa({
    required this.data,
  });

  final Data? data;

  factory UserKhsMahasiswa.fromJson(String str) => UserKhsMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserKhsMahasiswa.fromMap(Map<String, dynamic> json) => UserKhsMahasiswa(
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : data?.toMap(),
  };
}

class Data {
  Data({
    required this.khs,
    required this.khsMerdeka,
  });

  final Khs? khs;
  final KhsMerdeka? khsMerdeka;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    khs: json["khs"] == null ? null : Khs.fromMap(json["khs"]),
    khsMerdeka: json["khs_merdeka"] == null ? null : KhsMerdeka.fromMap(json["khs_merdeka"]),
  );

  Map<String, dynamic> toMap() => {
    "khs": khs == null ? null : khs?.toMap(),
    "khs_merdeka": khsMerdeka == null ? null : khsMerdeka?.toMap(),
  };
}

class Khs {
  Khs({
    required this.khs,
    required this.bobotSks,
    required this.ipk,
    required this.bobotKhs,
    required this.sksMaxDepan,
    required this.sksLulus,
    required this.pLulus,
  });

  final List<Kh>? khs;
  final int bobotSks;
  final String ipk;
  final int bobotKhs;
  final String sksMaxDepan;
  final int sksLulus;
  final String pLulus;

  factory Khs.fromJson(String str) => Khs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Khs.fromMap(Map<String, dynamic> json) => Khs(
    khs: json["khs"] == null ? null : List<Kh>.from(json["khs"].map((x) => Kh.fromMap(x))),
    bobotSks: json["bobot_sks"] == null ? null : json["bobot_sks"],
    ipk: json["ipk"] == null ? null : json["ipk"],
    bobotKhs: json["bobot_khs"] == null ? null : json["bobot_khs"],
    sksMaxDepan: json["sks_max_depan"] == null ? null : json["sks_max_depan"],
    sksLulus: json["sks_lulus"] == null ? null : json["sks_lulus"],
    pLulus: json["p_lulus"] == null ? null : json["p_lulus"],
  );

  Map<String, dynamic> toMap() => {
    "khs": khs == null ? null : List<dynamic>.from(khs!.map((x) => x.toMap())),
    "bobot_sks": bobotSks == null ? null : bobotSks,
    "ipk": ipk == null ? null : ipk,
    "bobot_khs": bobotKhs == null ? null : bobotKhs,
    "sks_max_depan": sksMaxDepan == null ? null : sksMaxDepan,
    "sks_lulus": sksLulus == null ? null : sksLulus,
    "p_lulus": pLulus == null ? null : pLulus,
  };
}

class Kh {
  Kh({
    required this.no,
    required this.klsId,
    required this.kode,
    required this.mk,
    required this.sks,
    required this.w,
    required this.tugas,
    required this.kurikulum,
    required this.uts,
    required this.uas,
    required this.prak,
    required this.prakLap,
    required this.presensi,
    required this.skill,
    required this.tutorial,
    required this.osce,
    required this.presentasi,
    required this.pkpa,
    required this.akademisi,
    required this.diseminasi,
    required this.ujiankompre,
    required this.tugaskhusus,
    required this.sikap,
    required this.pengetahuan,
    required this.ketUmum,
    required this.ketKhusus,
    required this.btugas,
    required this.buts,
    required this.buas,
    required this.bprak,
    required this.bprakLap,
    required this.bpresensi,
    required this.bskill,
    required this.btutorial,
    required this.bosce,
    required this.bpresentasi,
    required this.bpkpa,
    required this.bakademisi,
    required this.bdiseminasi,
    required this.bujiankompre,
    required this.btugaskhusus,
    required this.bsikap,
    required this.bpengetahuan,
    required this.bketUmum,
    required this.bketKhusus,
    required this.angka,
    required this.bobot,
    required this.status,
    required this.huruf,
    required this.tampil,
    required this.validasi,
  });

  final int no;
  final String klsId;
  final String kode;
  final String mk;
  final String sks;
  final String w;
  final String tugas;
  final String kurikulum;
  final String uts;
  final String uas;
  final String prak;
  final dynamic prakLap;
  final dynamic presensi;
  final dynamic skill;
  final dynamic tutorial;
  final dynamic osce;
  final dynamic presentasi;
  final dynamic pkpa;
  final dynamic akademisi;
  final dynamic diseminasi;
  final dynamic ujiankompre;
  final dynamic tugaskhusus;
  final dynamic sikap;
  final dynamic pengetahuan;
  final dynamic ketUmum;
  final dynamic ketKhusus;
  final String btugas;
  final String buts;
  final String buas;
  final dynamic bprak;
  final String bprakLap;
  final dynamic bpresensi;
  final dynamic bskill;
  final dynamic btutorial;
  final dynamic bosce;
  final dynamic bpresentasi;
  final dynamic bpkpa;
  final dynamic bakademisi;
  final dynamic bdiseminasi;
  final dynamic bujiankompre;
  final dynamic btugaskhusus;
  final dynamic bsikap;
  final dynamic bpengetahuan;
  final dynamic bketUmum;
  final dynamic bketKhusus;
  final String angka;
  final String bobot;
  final int status;
  final String huruf;
  final String tampil;
  final String validasi;

  factory Kh.fromJson(String str) => Kh.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kh.fromMap(Map<String, dynamic> json) => Kh(
    no: json["no"] == null ? null : json["no"],
    klsId: json["klsId"] == null ? null : json["klsId"],
    kode: json["kode"] == null ? null : json["kode"],
    mk: json["mk"] == null ? null : json["mk"],
    sks: json["sks"] == null ? null : json["sks"],
    w: json["w"] == null ? null : json["w"],
    tugas: json["tugas"] == null ? null : json["tugas"],
    kurikulum: json["kurikulum"] == null ? null : json["kurikulum"],
    uts: json["uts"] == null ? null : json["uts"],
    uas: json["uas"] == null ? null : json["uas"],
    prak: json["prak"] == null ? null : json["prak"],
    prakLap: json["prak_lap"],
    presensi: json["presensi"],
    skill: json["skill"],
    tutorial: json["tutorial"],
    osce: json["osce"],
    presentasi: json["presentasi"],
    pkpa: json["pkpa"],
    akademisi: json["akademisi"],
    diseminasi: json["diseminasi"],
    ujiankompre: json["ujiankompre"],
    tugaskhusus: json["tugaskhusus"],
    sikap: json["sikap"],
    pengetahuan: json["pengetahuan"],
    ketUmum: json["ket_umum"],
    ketKhusus: json["ket_khusus"],
    btugas: json["btugas"] == null ? null : json["btugas"],
    buts: json["buts"] == null ? null : json["buts"],
    buas: json["buas"] == null ? null : json["buas"],
    bprak: json["bprak"],
    bprakLap: json["bprak_lap"] == null ? null : json["bprak_lap"],
    bpresensi: json["bpresensi"],
    bskill: json["bskill"],
    btutorial: json["btutorial"],
    bosce: json["bosce"],
    bpresentasi: json["bpresentasi"],
    bpkpa: json["bpkpa"],
    bakademisi: json["bakademisi"],
    bdiseminasi: json["bdiseminasi"],
    bujiankompre: json["bujiankompre"],
    btugaskhusus: json["btugaskhusus"],
    bsikap: json["bsikap"],
    bpengetahuan: json["bpengetahuan"],
    bketUmum: json["bket_umum"],
    bketKhusus: json["bket_khusus"],
    angka: json["angka"] == null ? null : json["angka"],
    bobot: json["bobot"] == null ? null : json["bobot"],
    status: json["status"] == null ? null : json["status"],
    huruf: json["huruf"] == null ? null : json["huruf"],
    tampil: json["tampil"] == null ? null : json["tampil"],
    validasi: json["validasi"] == null ? null : json["validasi"],
  );

  Map<String, dynamic> toMap() => {
    "no": no == null ? null : no,
    "klsId": klsId == null ? null : klsId,
    "kode": kode == null ? null : kode,
    "mk": mk == null ? null : mk,
    "sks": sks == null ? null : sks,
    "w": w == null ? null : w,
    "tugas": tugas == null ? null : tugas,
    "kurikulum": kurikulum == null ? null : kurikulum,
    "uts": uts == null ? null : uts,
    "uas": uas == null ? null : uas,
    "prak": prak == null ? null : prak,
    "prak_lap": prakLap,
    "presensi": presensi,
    "skill": skill,
    "tutorial": tutorial,
    "osce": osce,
    "presentasi": presentasi,
    "pkpa": pkpa,
    "akademisi": akademisi,
    "diseminasi": diseminasi,
    "ujiankompre": ujiankompre,
    "tugaskhusus": tugaskhusus,
    "sikap": sikap,
    "pengetahuan": pengetahuan,
    "ket_umum": ketUmum,
    "ket_khusus": ketKhusus,
    "btugas": btugas == null ? null : btugas,
    "buts": buts == null ? null : buts,
    "buas": buas == null ? null : buas,
    "bprak": bprak,
    "bprak_lap": bprakLap == null ? null : bprakLap,
    "bpresensi": bpresensi,
    "bskill": bskill,
    "btutorial": btutorial,
    "bosce": bosce,
    "bpresentasi": bpresentasi,
    "bpkpa": bpkpa,
    "bakademisi": bakademisi,
    "bdiseminasi": bdiseminasi,
    "bujiankompre": bujiankompre,
    "btugaskhusus": btugaskhusus,
    "bsikap": bsikap,
    "bpengetahuan": bpengetahuan,
    "bket_umum": bketUmum,
    "bket_khusus": bketKhusus,
    "angka": angka == null ? null : angka,
    "bobot": bobot == null ? null : bobot,
    "status": status == null ? null : status,
    "huruf": huruf == null ? null : huruf,
    "tampil": tampil == null ? null : tampil,
    "validasi": validasi == null ? null : validasi,
  };
}

class KhsMerdeka {
  KhsMerdeka({
    required this.csp,
  });

  final Csp? csp;

  factory KhsMerdeka.fromJson(String str) => KhsMerdeka.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KhsMerdeka.fromMap(Map<String, dynamic> json) => KhsMerdeka(
    csp: json["CSP"] == null ? null : Csp.fromMap(json["CSP"]),
  );

  Map<String, dynamic> toMap() => {
    "CSP": csp == null ? null : csp?.toMap(),
  };
}

class Csp {
  Csp();

  factory Csp.fromJson(String str) => Csp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Csp.fromMap(Map<String, dynamic> json) => Csp(
  );

  Map<String, dynamic> toMap() => {
  };
}