import 'dart:convert';

class UserModelMahasiswa {
  UserModelMahasiswa({
    required this.nim,
    required this.nama,
    required this.angkatan,
    required this.semAwal,
    required this.kurId,
    required this.kodeProdi,
    required this.nomorTes,
    required this.tanggalTerdaftar,
    required this.isAsing,
    required this.jenisKelamin,
    required this.kotaKodeLahir,
    required this.tanggalLahir,
    required this.agmrId,
    required this.stnkrId,
    required this.jumlahSaudara,
    required this.alamatMhs,
    required this.kelurahan,
    required this.kecamatan,
    required this.kotaKode,
    required this.ngrKode,
    required this.kodePos,
    required this.statrumahId,
    required this.sbdnrId,
    required this.hubbiayaId,
    required this.beasiswa,
    required this.wnrId,
    required this.jnspen,
    required this.jlrrKode,
    required this.ijazah,
    required this.asalSmta,
    required this.smtaKotaKode,
    required this.totalNilaiUn,
    required this.rataNilaiUn,
    required this.noTelp,
    required this.noHp,
    required this.email,
    required this.homepage,
    required this.foto,
    required this.stakmhsrKode,
    required this.usernameSia,
    required this.niuLama,
    required this.agreement,
    required this.tinggiBadan,
    required this.beratBadan,
    required this.golDarah,
    required this.s1TahunMasuk,
    required this.s1TahunTamat,
    required this.s1Pt,
    required this.s1Fakultas,
    required this.s1Prodi,
    required this.s1Ipk,
    required this.s1Gelar,
    required this.npwp,
    required this.nik,
    required this.nisn,
    required this.ortuPassword,
    required this.peraturanSkpi,
    required this.reservasiPin,
    required this.lastUpdate,
    required this.dariValidasiData,
    required this.isVerifikasi,
    required this.createdAt,
    required this.updatedAt,
    required this.statusAjukanReset,
    required this.keterangan,
    required this.konsentrasi,
    required this.konsentrasiAsing,
    required this.feedback,
    required this.prodi
  });

  final String nim;
  final String nama;
  final String angkatan;
  final String semAwal;
  final String kurId;
  final String kodeProdi;
  final String nomorTes;
  final DateTime? tanggalTerdaftar;
  final String isAsing;
  final String jenisKelamin;
  final String kotaKodeLahir;
  final DateTime? tanggalLahir;
  final String agmrId;
  final String stnkrId;
  final String jumlahSaudara;
  final String alamatMhs;
  final String kelurahan;
  final String kecamatan;
  final String kotaKode;
  final dynamic ngrKode;
  final String kodePos;
  final String statrumahId;
  final dynamic sbdnrId;
  final String hubbiayaId;
  final dynamic beasiswa;
  final dynamic wnrId;
  final String jnspen;
  final String jlrrKode;
  final dynamic ijazah;
  final String asalSmta;
  final String smtaKotaKode;
  final String totalNilaiUn;
  final String rataNilaiUn;
  final String noTelp;
  final dynamic noHp;
  final String email;
  final dynamic homepage;
  final String foto;
  final String stakmhsrKode;
  final dynamic usernameSia;
  final dynamic niuLama;
  final String agreement;
  final String tinggiBadan;
  final String beratBadan;
  final String golDarah;
  final dynamic s1TahunMasuk;
  final dynamic s1TahunTamat;
  final dynamic s1Pt;
  final dynamic s1Fakultas;
  final dynamic s1Prodi;
  final dynamic s1Ipk;
  final dynamic s1Gelar;
  final String npwp;
  final String nik;
  final String nisn;
  final String ortuPassword;
  final String peraturanSkpi;
  final dynamic reservasiPin;
  final DateTime? lastUpdate;
  final dynamic dariValidasiData;
  final dynamic isVerifikasi;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic statusAjukanReset;
  final dynamic keterangan;
  final dynamic konsentrasi;
  final dynamic konsentrasiAsing;
  final dynamic feedback;
  final Prodi? prodi;

  factory UserModelMahasiswa.fromJson(String str) =>
      UserModelMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswa.fromMap(Map<String, dynamic> json) =>
      UserModelMahasiswa(
        nim: json["nim"] == null ? null : json["nim"],
        nama: json["nama"] == null ? null : json["nama"],
        angkatan: json["angkatan"] == null ? null : json["angkatan"],
        semAwal: json["semAwal"] == null ? null : json["semAwal"],
        kurId: json["kurId"] == null ? null : json["kurId"],
        kodeProdi: json["kodeProdi"] == null ? null : json["kodeProdi"],
        nomorTes: json["nomorTes"] == null ? null : json["nomorTes"],
        tanggalTerdaftar: json["tanggalTerdaftar"] == null
            ? null
            : DateTime.parse(json["tanggalTerdaftar"]),
        isAsing: json["isAsing"] == null ? null : json["isAsing"],
        jenisKelamin:
            json["jenisKelamin"] == null ? null : json["jenisKelamin"],
        kotaKodeLahir:
            json["kotaKodeLahir"] == null ? null : json["kotaKodeLahir"],
        tanggalLahir: json["tanggalLahir"] == null
            ? null
            : DateTime.parse(json["tanggalLahir"]),
        agmrId: json["agmrId"] == null ? null : json["agmrId"],
        stnkrId: json["stnkrId"] == null ? null : json["stnkrId"],
        jumlahSaudara:
            json["jumlahSaudara"] == null ? null : json["jumlahSaudara"],
        alamatMhs: json["alamatMhs"] == null ? null : json["alamatMhs"],
        kelurahan: json["kelurahan"] == null ? null : json["kelurahan"],
        kecamatan: json["kecamatan"] == null ? null : json["kecamatan"],
        kotaKode: json["kotaKode"] == null ? null : json["kotaKode"],
        ngrKode: json["ngrKode"],
        kodePos: json["kodePos"] == null ? null : json["kodePos"],
        statrumahId: json["statrumahId"] == null ? null : json["statrumahId"],
        sbdnrId: json["sbdnrId"],
        hubbiayaId: json["hubbiayaId"] == null ? null : json["hubbiayaId"],
        beasiswa: json["beasiswa"],
        wnrId: json["wnrId"],
        jnspen: json["jnspen"] == null ? null : json["jnspen"],
        jlrrKode: json["jlrrKode"] == null ? null : json["jlrrKode"],
        ijazah: json["ijazah"],
        asalSmta: json["asalSmta"] == null ? null : json["asalSmta"],
        smtaKotaKode:
            json["smtaKotaKode"] == null ? null : json["smtaKotaKode"],
        totalNilaiUn:
            json["totalNilaiUN"] == null ? null : json["totalNilaiUN"],
        rataNilaiUn: json["rataNilaiUN"] == null ? null : json["rataNilaiUN"],
        noTelp: json["noTelp"] == null ? null : json["noTelp"],
        noHp: json["noHp"],
        email: json["email"] == null ? null : json["email"],
        homepage: json["homepage"],
        foto: json["foto"] == null ? null : json["foto"],
        stakmhsrKode:
            json["stakmhsrKode"] == null ? null : json["stakmhsrKode"],
        usernameSia: json["usernameSia"],
        niuLama: json["niuLama"],
        agreement: json["agreement"] == null ? null : json["agreement"],
        tinggiBadan: json["tinggiBadan"] == null ? null : json["tinggiBadan"],
        beratBadan: json["beratBadan"] == null ? null : json["beratBadan"],
        golDarah: json["golDarah"] == null ? null : json["golDarah"],
        s1TahunMasuk: json["s1TahunMasuk"],
        s1TahunTamat: json["s1TahunTamat"],
        s1Pt: json["s1Pt"],
        s1Fakultas: json["s1Fakultas"],
        s1Prodi: json["s1Prodi"],
        s1Ipk: json["s1IPK"],
        s1Gelar: json["s1Gelar"],
        npwp: json["npwp"] == null ? null : json["npwp"],
        nik: json["nik"] == null ? null : json["nik"],
        nisn: json["nisn"] == null ? null : json["nisn"],
        ortuPassword:
            json["ortuPassword"] == null ? null : json["ortuPassword"],
        peraturanSkpi:
            json["peraturanSkpi"] == null ? null : json["peraturanSkpi"],
        reservasiPin: json["reservasiPin"],
        lastUpdate: json["lastUpdate"] == null
            ? null
            : DateTime.parse(json["lastUpdate"]),
        dariValidasiData: json["dariValidasiData"],
        isVerifikasi: json["isVerifikasi"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        statusAjukanReset: json["statusAjukanReset"],
        keterangan: json["keterangan"],
        konsentrasi: json["konsentrasi"],
        konsentrasiAsing: json["konsentrasiAsing"],
        feedback: json["feedback"],
        prodi: json["prodi"] == null ? null : Prodi.fromMap(json["prodi"]),
      );

  Map<String, dynamic> toMap() => {
        "nim": nim == null ? null : nim,
        "nama": nama == null ? null : nama,
        "angkatan": angkatan == null ? null : angkatan,
        "semAwal": semAwal == null ? null : semAwal,
        "kurId": kurId == null ? null : kurId,
        "kodeProdi": kodeProdi == null ? null : kodeProdi,
        "nomorTes": nomorTes == null ? null : nomorTes,
        "tanggalTerdaftar": tanggalTerdaftar == null
            ? null
            : "${tanggalTerdaftar?.year.toString().padLeft(4, '0')}-${tanggalTerdaftar?.month.toString().padLeft(2, '0')}-${tanggalTerdaftar?.day.toString().padLeft(2, '0')}",
        "isAsing": isAsing == null ? null : isAsing,
        "jenisKelamin": jenisKelamin == null ? null : jenisKelamin,
        "kotaKodeLahir": kotaKodeLahir == null ? null : kotaKodeLahir,
        "tanggalLahir": tanggalLahir == null
            ? null
            : "${tanggalLahir?.year.toString().padLeft(4, '0')}-${tanggalLahir?.month.toString().padLeft(2, '0')}-${tanggalLahir?.day.toString().padLeft(2, '0')}",
        "agmrId": agmrId == null ? null : agmrId,
        "stnkrId": stnkrId == null ? null : stnkrId,
        "jumlahSaudara": jumlahSaudara == null ? null : jumlahSaudara,
        "alamatMhs": alamatMhs == null ? null : alamatMhs,
        "kelurahan": kelurahan == null ? null : kelurahan,
        "kecamatan": kecamatan == null ? null : kecamatan,
        "kotaKode": kotaKode == null ? null : kotaKode,
        "ngrKode": ngrKode,
        "kodePos": kodePos == null ? null : kodePos,
        "statrumahId": statrumahId == null ? null : statrumahId,
        "sbdnrId": sbdnrId,
        "hubbiayaId": hubbiayaId == null ? null : hubbiayaId,
        "beasiswa": beasiswa,
        "wnrId": wnrId,
        "jnspen": jnspen == null ? null : jnspen,
        "jlrrKode": jlrrKode == null ? null : jlrrKode,
        "ijazah": ijazah,
        "asalSmta": asalSmta == null ? null : asalSmta,
        "smtaKotaKode": smtaKotaKode == null ? null : smtaKotaKode,
        "totalNilaiUN": totalNilaiUn == null ? null : totalNilaiUn,
        "rataNilaiUN": rataNilaiUn == null ? null : rataNilaiUn,
        "noTelp": noTelp == null ? null : noTelp,
        "noHp": noHp,
        "email": email == null ? null : email,
        "homepage": homepage,
        "foto": foto == null ? null : foto,
        "stakmhsrKode": stakmhsrKode == null ? null : stakmhsrKode,
        "usernameSia": usernameSia,
        "niuLama": niuLama,
        "agreement": agreement == null ? null : agreement,
        "tinggiBadan": tinggiBadan == null ? null : tinggiBadan,
        "beratBadan": beratBadan == null ? null : beratBadan,
        "golDarah": golDarah == null ? null : golDarah,
        "s1TahunMasuk": s1TahunMasuk,
        "s1TahunTamat": s1TahunTamat,
        "s1Pt": s1Pt,
        "s1Fakultas": s1Fakultas,
        "s1Prodi": s1Prodi,
        "s1IPK": s1Ipk,
        "s1Gelar": s1Gelar,
        "npwp": npwp == null ? null : npwp,
        "nik": nik == null ? null : nik,
        "nisn": nisn == null ? null : nisn,
        "ortuPassword": ortuPassword == null ? null : ortuPassword,
        "peraturanSkpi": peraturanSkpi == null ? null : peraturanSkpi,
        "reservasiPin": reservasiPin,
        "lastUpdate": lastUpdate == null ? null : lastUpdate?.toIso8601String(),
        "dariValidasiData": dariValidasiData,
        "isVerifikasi": isVerifikasi,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "statusAjukanReset": statusAjukanReset,
        "keterangan": keterangan,
        "konsentrasi": konsentrasi,
        "konsentrasiAsing": konsentrasiAsing,
        "feedback": feedback,
        "prodi": prodi == null ? null : prodi?.toMap(),
      };
}

class Prodi {
  Prodi({
    required this.kode,
    required this.nama,
    required this.gelar,
    required this.jenjang,
    required this.createdAt,
    required this.namaAsing,
    required this.updatedAt,
    required this.gelarAsing,
    required this.statusProfesi,
    required this.gelarKelulusan,
    required this.jenisPendidikan,
    required this.syaratPenerimaan,
    required this.programPendidikan,
    required this.pendidikanLanjutan,
  });

  final int kode;
  final String nama;
  final String gelar;
  final String jenjang;
  final DateTime? createdAt;
  final String namaAsing;
  final DateTime? updatedAt;
  final String gelarAsing;
  final String statusProfesi;
  final String gelarKelulusan;
  final String jenisPendidikan;
  final String syaratPenerimaan;
  final String programPendidikan;
  final String pendidikanLanjutan;

  factory Prodi.fromJson(String str) => Prodi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Prodi.fromMap(Map<String, dynamic> json) => Prodi(
    kode: json["kode"] == null ? null : json["kode"],
    nama: json["nama"] == null ? null : json["nama"],
    gelar: json["gelar"] == null ? null : json["gelar"],
    jenjang: json["jenjang"] == null ? null : json["jenjang"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    namaAsing: json["namaAsing"] == null ? null : json["namaAsing"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    gelarAsing: json["gelarAsing"] == null ? null : json["gelarAsing"],
    statusProfesi: json["statusProfesi"] == null ? null : json["statusProfesi"],
    gelarKelulusan: json["gelarKelulusan"] == null ? null : json["gelarKelulusan"],
    jenisPendidikan: json["jenisPendidikan"] == null ? null : json["jenisPendidikan"],
    syaratPenerimaan: json["syaratPenerimaan"] == null ? null : json["syaratPenerimaan"],
    programPendidikan: json["programPendidikan"] == null ? null : json["programPendidikan"],
    pendidikanLanjutan: json["pendidikanLanjutan"] == null ? null : json["pendidikanLanjutan"],
  );

  Map<String, dynamic> toMap() => {
    "kode": kode == null ? null : kode,
    "nama": nama == null ? null : nama,
    "gelar": gelar == null ? null : gelar,
    "jenjang": jenjang == null ? null : jenjang,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "namaAsing": namaAsing == null ? null : namaAsing,
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "gelarAsing": gelarAsing == null ? null : gelarAsing,
    "statusProfesi": statusProfesi == null ? null : statusProfesi,
    "gelarKelulusan": gelarKelulusan == null ? null : gelarKelulusan,
    "jenisPendidikan": jenisPendidikan == null ? null : jenisPendidikan,
    "syaratPenerimaan": syaratPenerimaan == null ? null : syaratPenerimaan,
    "programPendidikan": programPendidikan == null ? null : programPendidikan,
    "pendidikanLanjutan": pendidikanLanjutan == null ? null : pendidikanLanjutan,
  };
}
