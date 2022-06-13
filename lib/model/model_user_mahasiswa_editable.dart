// To parse this JSON data, do
//
//     final userModelMahasiswa = userModelMahasiswaFromMap(jsonString);

import 'dart:convert';

class UserModelMahasiswaEditable {
  UserModelMahasiswaEditable({
    this.jenjang,
    this.agreement,
    this.nim,
    this.nik,
    this.npwp,
    this.nama,
    this.tempatLahir,
    this.tglLahir,
    this.ttl,
    this.jkKode,
    this.jk,
    this.statusNikahKode,
    this.statusNikah,
    this.agamaKode,
    this.agama,
    this.hpMhs,
    this.emailMhs,
    this.jalurMasukKode,
    this.jalurMasuk,
    this.alamatMhs,
    this.alamatMhsProv,
    this.alamatMhsProvKode,
    this.alamatMhsKota,
    this.alamatMhsKotaKode,
    this.alamatMhsKecamatan,
    this.alamatMhsKecamatanKode,
    this.alamatMhsKelurahan,
    this.alamatMhsKodepos,
    this.statusRumahKode,
    this.statusRumah,
    this.pembiayaanKode,
    this.pembiayaan,
    this.jumlahSaudara,
    this.tinggi,
    this.berat,
    this.gol,
    this.nisn,
    this.sekolahNama,
    this.sekolahKota,
    this.sekolahKotaKode,
    this.sekolahProvKode,
    this.sekolahNilaiUn,
    this.sekolahNilaiUnRata2,
    this.univNama,
    this.univFakultas,
    this.univProdi,
    this.univIpk,
    this.univGelar,
    this.univTahunMasuk,
    this.univTahunLulus,
    this.ayahNama,
    this.ayahNik,
    this.ayahKematian,
    this.ayahKematianKode,
    this.ayahPekerjaanKode,
    this.ayahPekerjaan,
    this.ibuNama,
    this.ibuNik,
    this.ibuKematian,
    this.ibuKematianKode,
    this.ibuPekerjaanKode,
    this.ibuPekerjaan,
    this.ortuAlamat,
    this.ortuAlamatKota,
    this.ortuAlamatKotaKode,
    this.ortuAlamatProvKode,
    this.ortuAlamatKodepos,
    this.ortuAgamaKode,
    this.ortuAgama,
    this.ortuTelp,
    this.ortuPenghasilanKode,
    this.ortuPenghasilan,
    this.ortuTanggungan,
    this.waliNama,
    this.waliAlamat,
    this.waliAlamatKota,
    this.waliAlamatKotaKode,
    this.waliAlamatProvKode,
    this.waliAlamatKodepos,
    this.waliTelp,
    this.isAdaWali,
  });

  final ValueClass? jenjang;
  final ValueClass? agreement;
  final ValueClass? nim;
  final ValueClass? nik;
  final ValueClass? npwp;
  final ValueClass? nama;
  final ValueClass? tempatLahir;
  final ValueClass? tglLahir;
  final ValueClass? ttl;
  final ValueClass? jkKode;
  final ValueClass? jk;
  final ValueClass? statusNikahKode;
  final ValueClass? statusNikah;
  final ValueClass? agamaKode;
  final ValueClass? agama;
  final ValueClass? hpMhs;
  final ValueClass? emailMhs;
  final ValueClass? jalurMasukKode;
  final ValueClass? jalurMasuk;
  final ValueClass? alamatMhs;
  final ValueClass? alamatMhsProv;
  final ValueClass? alamatMhsProvKode;
  final ValueClass? alamatMhsKota;
  final ValueClass? alamatMhsKotaKode;
  final ValueClass? alamatMhsKecamatan;
  final ValueClass? alamatMhsKecamatanKode;
  final ValueClass? alamatMhsKelurahan;
  final ValueClass? alamatMhsKodepos;
  final ValueClass? statusRumahKode;
  final ValueClass? statusRumah;
  final ValueClass? pembiayaanKode;
  final ValueClass? pembiayaan;
  final ValueClass? jumlahSaudara;
  final ValueClass? tinggi;
  final ValueClass? berat;
  final ValueClass? gol;
  final ValueClass? nisn;
  final ValueClass? sekolahNama;
  final ValueClass? sekolahKota;
  final ValueClass? sekolahKotaKode;
  final ValueClass? sekolahProvKode;
  final ValueClass? sekolahNilaiUn;
  final ValueClass? sekolahNilaiUnRata2;
  final ValueClass? univNama;
  final ValueClass? univFakultas;
  final ValueClass? univProdi;
  final ValueClass? univIpk;
  final ValueClass? univGelar;
  final ValueClass? univTahunMasuk;
  final ValueClass? univTahunLulus;
  final ValueClass? ayahNama;
  final ValueClass? ayahNik;
  final ValueClass? ayahKematian;
  final ValueClass? ayahKematianKode;
  final ValueClass? ayahPekerjaanKode;
  final ValueClass? ayahPekerjaan;
  final ValueClass? ibuNama;
  final ValueClass? ibuNik;
  final ValueClass? ibuKematian;
  final ValueClass? ibuKematianKode;
  final ValueClass? ibuPekerjaanKode;
  final ValueClass? ibuPekerjaan;
  final ValueClass? ortuAlamat;
  final ValueClass? ortuAlamatKota;
  final ValueClass? ortuAlamatKotaKode;
  final ValueClass? ortuAlamatProvKode;
  final ValueClass? ortuAlamatKodepos;
  final ValueClass? ortuAgamaKode;
  final ValueClass? ortuAgama;
  final ValueClass? ortuTelp;
  final ValueClass? ortuPenghasilanKode;
  final ValueClass? ortuPenghasilan;
  final ValueClass? ortuTanggungan;
  final ValueClass? waliNama;
  final ValueClass? waliAlamat;
  final ValueClass? waliAlamatKota;
  final ValueClass? waliAlamatKotaKode;
  final ValueClass? waliAlamatProvKode;
  final ValueClass? waliAlamatKodepos;
  final ValueClass? waliTelp;
  final ValueClass? isAdaWali;

  factory UserModelMahasiswaEditable.fromJson(String str) =>
      UserModelMahasiswaEditable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaEditable.fromMap(Map<String, dynamic> json) =>
      UserModelMahasiswaEditable(
        jenjang: json["jenjang"] == null
            ? null
            : ValueClass.fromMap(json["jenjang"]),
        agreement: json["agreement"] == null
            ? null
            : ValueClass.fromMap(json["agreement"]),
        nim: json["nim"] == null ? null : ValueClass.fromMap(json["nim"]),
        nik: json["nik"] == null ? null : ValueClass.fromMap(json["nik"]),
        npwp: json["npwp"] == null ? null : ValueClass.fromMap(json["npwp"]),
        nama: json["nama"] == null ? null : ValueClass.fromMap(json["nama"]),
        tempatLahir: json["tempat_lahir"] == null
            ? null
            : ValueClass?.fromMap(json["tempat_lahir"]),
        tglLahir: json["tgl_lahir"] == null
            ? null
            : ValueClass?.fromMap(json["tgl_lahir"]),
        ttl: json["ttl"] == null ? null : ValueClass?.fromMap(json["ttl"]),
        jkKode: json["jk_kode"] == null
            ? null
            : ValueClass?.fromMap(json["jk_kode"]),
        jk: json["jk"] == null ? null : ValueClass?.fromMap(json["jk"]),
        statusNikahKode: json["status_nikah_kode"] == null
            ? null
            : ValueClass?.fromMap(json["status_nikah_kode"]),
        statusNikah: json["status_nikah"] == null
            ? null
            : ValueClass?.fromMap(json["status_nikah"]),
        agamaKode: json["agama_kode"] == null
            ? null
            : ValueClass?.fromMap(json["agama_kode"]),
        agama:
            json["agama"] == null ? null : ValueClass?.fromMap(json["agama"]),
        hpMhs:
            json["hp_mhs"] == null ? null : ValueClass?.fromMap(json["hp_mhs"]),
        emailMhs: json["email_mhs"] == null
            ? null
            : ValueClass?.fromMap(json["email_mhs"]),
        jalurMasukKode: json["jalur_masuk_kode"] == null
            ? null
            : ValueClass?.fromMap(json["jalur_masuk_kode"]),
        jalurMasuk: json["jalur_masuk"] == null
            ? null
            : ValueClass?.fromMap(json["jalur_masuk"]),
        alamatMhs: json["alamat_mhs"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs"]),
        alamatMhsProv: json["alamat_mhs_prov"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_prov"]),
        alamatMhsProvKode: json["alamat_mhs_prov_kode"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_prov_kode"]),
        alamatMhsKota: json["alamat_mhs_kota"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kota"]),
        alamatMhsKotaKode: json["alamat_mhs_kota_kode"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kota_kode"]),
        alamatMhsKecamatan: json["alamat_mhs_kecamatan"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kecamatan"]),
        alamatMhsKecamatanKode: json["alamat_mhs_kecamatan_kode"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kecamatan_kode"]),
        alamatMhsKelurahan: json["alamat_mhs_kelurahan"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kelurahan"]),
        alamatMhsKodepos: json["alamat_mhs_kodepos"] == null
            ? null
            : ValueClass?.fromMap(json["alamat_mhs_kodepos"]),
        statusRumahKode: json["status_rumah_kode"] == null
            ? null
            : ValueClass?.fromMap(json["status_rumah_kode"]),
        statusRumah: json["status_rumah"] == null
            ? null
            : ValueClass?.fromMap(json["status_rumah"]),
        pembiayaanKode: json["pembiayaan_kode"] == null
            ? null
            : ValueClass?.fromMap(json["pembiayaan_kode"]),
        pembiayaan: json["pembiayaan"] == null
            ? null
            : ValueClass?.fromMap(json["pembiayaan"]),
        jumlahSaudara: json["jumlah_saudara"] == null
            ? null
            : ValueClass?.fromMap(json["jumlah_saudara"]),
        tinggi:
            json["tinggi"] == null ? null : ValueClass?.fromMap(json["tinggi"]),
        berat:
            json["berat"] == null ? null : ValueClass?.fromMap(json["berat"]),
        gol: json["gol"] == null ? null : ValueClass?.fromMap(json["gol"]),
        nisn: json["nisn"] == null ? null : ValueClass?.fromMap(json["nisn"]),
        sekolahNama: json["sekolah_nama"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_nama"]),
        sekolahKota: json["sekolah_kota"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_kota"]),
        sekolahKotaKode: json["sekolah_kota_kode"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_kota_kode"]),
        sekolahProvKode: json["sekolah_prov_kode"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_prov_kode"]),
        sekolahNilaiUn: json["sekolah_nilai_un"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_nilai_un"]),
        sekolahNilaiUnRata2: json["sekolah_nilai_un_rata2"] == null
            ? null
            : ValueClass?.fromMap(json["sekolah_nilai_un_rata2"]),
        univNama: json["univ_nama"] == null
            ? null
            : ValueClass?.fromMap(json["univ_nama"]),
        univFakultas: json["univ_fakultas"] == null
            ? null
            : ValueClass?.fromMap(json["univ_fakultas"]),
        univProdi: json["univ_prodi"] == null
            ? null
            : ValueClass?.fromMap(json["univ_prodi"]),
        univIpk: json["univ_ipk"] == null
            ? null
            : ValueClass?.fromMap(json["univ_ipk"]),
        univGelar: json["univ_gelar"] == null
            ? null
            : ValueClass?.fromMap(json["univ_gelar"]),
        univTahunMasuk: json["univ_tahun_masuk"] == null
            ? null
            : ValueClass?.fromMap(json["univ_tahun_masuk"]),
        univTahunLulus: json["univ_tahun_lulus"] == null
            ? null
            : ValueClass?.fromMap(json["univ_tahun_lulus"]),
        ayahNama: json["ayah_nama"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_nama"]),
        ayahNik: json["ayah_nik"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_nik"]),
        ayahKematian: json["ayah_kematian"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_kematian"]),
        ayahKematianKode: json["ayah_kematian_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_kematian_kode"]),
        ayahPekerjaanKode: json["ayah_pekerjaan_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_pekerjaan_kode"]),
        ayahPekerjaan: json["ayah_pekerjaan"] == null
            ? null
            : ValueClass?.fromMap(json["ayah_pekerjaan"]),
        ibuNama: json["ibu_nama"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_nama"]),
        ibuNik: json["ibu_nik"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_nik"]),
        ibuKematian: json["ibu_kematian"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_kematian"]),
        ibuKematianKode: json["ibu_kematian_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_kematian_kode"]),
        ibuPekerjaanKode: json["ibu_pekerjaan_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_pekerjaan_kode"]),
        ibuPekerjaan: json["ibu_pekerjaan"] == null
            ? null
            : ValueClass?.fromMap(json["ibu_pekerjaan"]),
        ortuAlamat: json["ortu_alamat"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_alamat"]),
        ortuAlamatKota: json["ortu_alamat_kota"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_alamat_kota"]),
        ortuAlamatKotaKode: json["ortu_alamat_kota_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_alamat_kota_kode"]),
        ortuAlamatProvKode: json["ortu_alamat_prov_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_alamat_prov_kode"]),
        ortuAlamatKodepos: json["ortu_alamat_kodepos"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_alamat_kodepos"]),
        ortuAgamaKode: json["ortu_agama_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_agama_kode"]),
        ortuAgama: json["ortu_agama"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_agama"]),
        ortuTelp: json["ortu_telp"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_telp"]),
        ortuPenghasilanKode: json["ortu_penghasilan_kode"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_penghasilan_kode"]),
        ortuPenghasilan: json["ortu_penghasilan"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_penghasilan"]),
        ortuTanggungan: json["ortu_tanggungan"] == null
            ? null
            : ValueClass?.fromMap(json["ortu_tanggungan"]),
        waliNama: json["wali_nama"] == null
            ? null
            : ValueClass?.fromMap(json["wali_nama"]),
        waliAlamat: json["wali_alamat"] == null
            ? null
            : ValueClass?.fromMap(json["wali_alamat"]),
        waliAlamatKota: json["wali_alamat_kota"] == null
            ? null
            : ValueClass?.fromMap(json["wali_alamat_kota"]),
        waliAlamatKotaKode: json["wali_alamat_kota_kode"] == null
            ? null
            : ValueClass?.fromMap(json["wali_alamat_kota_kode"]),
        waliAlamatProvKode: json["wali_alamat_prov_kode"] == null
            ? null
            : ValueClass?.fromMap(json["wali_alamat_prov_kode"]),
        waliAlamatKodepos: json["wali_alamat_kodepos"] == null
            ? null
            : ValueClass?.fromMap(json["wali_alamat_kodepos"]),
        waliTelp: json["wali_telp"] == null
            ? null
            : ValueClass?.fromMap(json["wali_telp"]),
      );

  Map<String, dynamic> toMap() => {
        "jenjang": jenjang == null ? null : jenjang?.toMap(),
        "agreement": agreement == null ? null : agreement?.toMap(),
        "nim": nim == null ? null : nim?.toMap(),
        "nik": nik == null ? null : nik?.toMap(),
        "npwp": npwp == null ? null : npwp?.toMap(),
        "nama": nama == null ? null : nama?.toMap(),
        "tempat_lahir": tempatLahir == null ? null : tempatLahir?.toMap(),
        "tgl_lahir": tglLahir == null ? null : tglLahir?.toMap(),
        "ttl": ttl == null ? null : ttl?.toMap(),
        "jk_kode": jkKode == null ? null : jkKode?.toMap(),
        "jk": jk == null ? null : jk?.toMap(),
        "status_nikah_kode":
            statusNikahKode == null ? null : statusNikahKode?.toMap(),
        "status_nikah": statusNikah == null ? null : statusNikah?.toMap(),
        "agama_kode": agamaKode == null ? null : agamaKode?.toMap(),
        "agama": agama == null ? null : agama?.toMap(),
        "hp_mhs": hpMhs == null ? null : hpMhs?.toMap(),
        "email_mhs": emailMhs == null ? null : emailMhs?.toMap(),
        "jalur_masuk_kode":
            jalurMasukKode == null ? null : jalurMasukKode?.toMap(),
        "jalur_masuk": jalurMasuk == null ? null : jalurMasuk?.toMap(),
        "alamat_mhs": alamatMhs == null ? null : alamatMhs?.toMap(),
        "alamat_mhs_prov":
            alamatMhsProv == null ? null : alamatMhsProv?.toMap(),
        "alamat_mhs_prov_kode":
            alamatMhsProvKode == null ? null : alamatMhsProvKode?.toMap(),
        "alamat_mhs_kota":
            alamatMhsKota == null ? null : alamatMhsKota?.toMap(),
        "alamat_mhs_kota_kode":
            alamatMhsKotaKode == null ? null : alamatMhsKotaKode?.toMap(),
        "alamat_mhs_kecamatan":
            alamatMhsKecamatan == null ? null : alamatMhsKecamatan?.toMap(),
        "alamat_mhs_kecamatan_kode": alamatMhsKecamatanKode == null
            ? null
            : alamatMhsKecamatanKode?.toMap(),
        "alamat_mhs_kelurahan":
            alamatMhsKelurahan == null ? null : alamatMhsKelurahan?.toMap(),
        "alamat_mhs_kodepos":
            alamatMhsKodepos == null ? null : alamatMhsKodepos?.toMap(),
        "status_rumah_kode":
            statusRumahKode == null ? null : statusRumahKode?.toMap(),
        "status_rumah": statusRumah == null ? null : statusRumah?.toMap(),
        "pembiayaan_kode":
            pembiayaanKode == null ? null : pembiayaanKode?.toMap(),
        "pembiayaan": pembiayaan == null ? null : pembiayaan?.toMap(),
        "jumlah_saudara": jumlahSaudara == null ? null : jumlahSaudara?.toMap(),
        "tinggi": tinggi == null ? null : tinggi?.toMap(),
        "berat": berat == null ? null : berat?.toMap(),
        "gol": gol == null ? null : gol?.toMap(),
        "nisn": nisn == null ? null : nisn?.toMap(),
        "sekolah_nama": sekolahNama == null ? null : sekolahNama?.toMap(),
        "sekolah_kota": sekolahKota == null ? null : sekolahKota?.toMap(),
        "sekolah_kota_kode":
            sekolahKotaKode == null ? null : sekolahKotaKode?.toMap(),
        "sekolah_prov_kode":
            sekolahProvKode == null ? null : sekolahProvKode?.toMap(),
        "sekolah_nilai_un":
            sekolahNilaiUn == null ? null : sekolahNilaiUn?.toMap(),
        "sekolah_nilai_un_rata2":
            sekolahNilaiUnRata2 == null ? null : sekolahNilaiUnRata2?.toMap(),
        "univ_nama": univNama == null ? null : univNama?.toMap(),
        "univ_fakultas": univFakultas == null ? null : univFakultas?.toMap(),
        "univ_prodi": univProdi == null ? null : univProdi?.toMap(),
        "univ_ipk": univIpk == null ? null : univIpk?.toMap(),
        "univ_gelar": univGelar == null ? null : univGelar?.toMap(),
        "univ_tahun_masuk":
            univTahunMasuk == null ? null : univTahunMasuk?.toMap(),
        "univ_tahun_lulus":
            univTahunLulus == null ? null : univTahunLulus?.toMap(),
        "ayah_nama": ayahNama == null ? null : ayahNama?.toMap(),
        "ayah_nik": ayahNik == null ? null : ayahNik?.toMap(),
        "ayah_kematian": ayahKematian == null ? null : ayahKematian?.toMap(),
        "ayah_kematian_kode":
            ayahKematianKode == null ? null : ayahKematianKode?.toMap(),
        "ayah_pekerjaan_kode":
            ayahPekerjaanKode == null ? null : ayahPekerjaanKode?.toMap(),
        "ayah_pekerjaan": ayahPekerjaan == null ? null : ayahPekerjaan?.toMap(),
        "ibu_nama": ibuNama == null ? null : ibuNama?.toMap(),
        "ibu_nik": ibuNik == null ? null : ibuNik?.toMap(),
        "ibu_kematian": ibuKematian == null ? null : ibuKematian?.toMap(),
        "ibu_kematian_kode":
            ibuKematianKode == null ? null : ibuKematianKode?.toMap(),
        "ibu_pekerjaan_kode":
            ibuPekerjaanKode == null ? null : ibuPekerjaanKode?.toMap(),
        "ibu_pekerjaan": ibuPekerjaan == null ? null : ibuPekerjaan?.toMap(),
        "ortu_alamat": ortuAlamat == null ? null : ortuAlamat?.toMap(),
        "ortu_alamat_kota":
            ortuAlamatKota == null ? null : ortuAlamatKota?.toMap(),
        "ortu_alamat_kota_kode":
            ortuAlamatKotaKode == null ? null : ortuAlamatKotaKode?.toMap(),
        "ortu_alamat_prov_kode":
            ortuAlamatProvKode == null ? null : ortuAlamatProvKode?.toMap(),
        "ortu_alamat_kodepos":
            ortuAlamatKodepos == null ? null : ortuAlamatKodepos?.toMap(),
        "ortu_agama_kode":
            ortuAgamaKode == null ? null : ortuAgamaKode?.toMap(),
        "ortu_agama": ortuAgama == null ? null : ortuAgama?.toMap(),
        "ortu_telp": ortuTelp == null ? null : ortuTelp?.toMap(),
        "ortu_penghasilan_kode":
            ortuPenghasilanKode == null ? null : ortuPenghasilanKode?.toMap(),
        "ortu_penghasilan":
            ortuPenghasilan == null ? null : ortuPenghasilan?.toMap(),
        "ortu_tanggungan":
            ortuTanggungan == null ? null : ortuTanggungan?.toMap(),
        "wali_nama": waliNama == null ? null : waliNama?.toMap(),
        "wali_alamat": waliAlamat == null ? null : waliAlamat?.toMap(),
        "wali_alamat_kota":
            waliAlamatKota == null ? null : waliAlamatKota?.toMap(),
        "wali_alamat_kota_kode":
            waliAlamatKotaKode == null ? null : waliAlamatKotaKode?.toMap(),
        "wali_alamat_prov_kode":
            waliAlamatProvKode == null ? null : waliAlamatProvKode?.toMap(),
        "wali_alamat_kodepos":
            waliAlamatKodepos == null ? null : waliAlamatKodepos?.toMap(),
        "wali_telp": waliTelp == null ? null : waliTelp?.toMap(),
      };
}

class ValueClass {
  ValueClass({
    required this.value,
    required this.isEdit,
  });

  final String value;
  final int isEdit;

  factory ValueClass.fromJson(String str) =>
      ValueClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValueClass.fromMap(Map<String, dynamic> json) => ValueClass(
        value: json["value"] == null ? null : json["value"],
        isEdit: json["isEdit"] == null ? null : json["isEdit"],
      );

  Map<String, dynamic> toMap() => {
        "value": value == null ? null : value,
        "isEdit": isEdit == null ? null : isEdit,
      };
}
