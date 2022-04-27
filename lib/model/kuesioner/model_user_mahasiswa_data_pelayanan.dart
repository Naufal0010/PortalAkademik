import 'dart:convert';

class UserModelMahasiswaDataKuesionerPelayanan {
  UserModelMahasiswaDataKuesionerPelayanan({
    required this.data,
  });

  final List<DataKuesionerPelayanan>? data;

  factory UserModelMahasiswaDataKuesionerPelayanan.fromJson(String str) => UserModelMahasiswaDataKuesionerPelayanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelMahasiswaDataKuesionerPelayanan.fromMap(List<dynamic> json) => UserModelMahasiswaDataKuesionerPelayanan(
    data: json == null ? null : List<DataKuesionerPelayanan>.from(json.map((x) => DataKuesionerPelayanan.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataKuesionerPelayanan {
  DataKuesionerPelayanan({
    required this.kategori,
    required this.kuisioner,
  });

  final DataKategori? kategori;
  final List<DataKuesionerKategori>? kuisioner;

  factory DataKuesionerPelayanan.fromJson(String str) => DataKuesionerPelayanan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKuesionerPelayanan.fromMap(Map<String, dynamic> json) => DataKuesionerPelayanan(
    kategori: json["kategori"] == null ? null : DataKategori.fromMap(json["kategori"]),
    kuisioner: json["kuisioner"] == null ? null : List<DataKuesionerKategori>.from(json["kuisioner"].map((x) => DataKuesionerKategori.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "kategori": kategori == null ? null : kategori?.toMap(),
    "kuisioner": kuisioner == null ? null : List<dynamic>.from(kuisioner!.map((x) => x.toMap())),
  };
}

class DataKategori {
  DataKategori({
    required this.kategoriId,
    required this.kategoriNama,
    required this.kategoriSoal,
    required this.isWajibOnly,
  });

  final dynamic kategoriId;
  final String? kategoriNama;
  final String? kategoriSoal;
  final int isWajibOnly;

  factory DataKategori.fromJson(String str) => DataKategori.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKategori.fromMap(Map<String, dynamic> json) => DataKategori(
    kategoriId: json["kategoriId"],
    kategoriNama: json["kategoriNama"] == null ? null : json["kategoriNama"],
    kategoriSoal: json["kategoriSoal"] == null ? null : json["kategoriSoal"],
    isWajibOnly: json["isWajibOnly"] == null ? null : json["isWajibOnly"],
  );

  Map<String, dynamic> toMap() => {
    "kategoriId": kategoriId,
    "kategoriNama": kategoriNama == null ? null : kategoriNama,
    "kategoriSoal": kategoriSoal == null ? null : kategoriSoal,
    "isWajibOnly": isWajibOnly == null ? null : isWajibOnly,
  };
}

class DataKuesionerKategori {
  DataKuesionerKategori({
    required this.soalId,
    required this.soalNama,
    required this.soalKategoriId,
    required this.soalStatus,
  });

  final String soalId;
  final String soalNama;
  final String soalKategoriId;
  final String soalStatus;

  factory DataKuesionerKategori.fromJson(String str) => DataKuesionerKategori.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKuesionerKategori.fromMap(Map<String, dynamic> json) => DataKuesionerKategori(
    soalId: json["soalId"] == null ? null : json["soalId"],
    soalNama: json["soalNama"] == null ? null : json["soalNama"],
    soalKategoriId: json["soalKategoriId"] == null ? null : json["soalKategoriId"],
    soalStatus: json["soalStatus"] == null ? null : json["soalStatus"],
  );

  Map<String, dynamic> toMap() => {
    "soalId": soalId == null ? null : soalId,
    "soalNama": soalNama == null ? null : soalNama,
    "soalKategoriId": soalKategoriId == null ? null : soalKategoriId,
    "soalStatus": soalStatus == null ? null : soalStatus,
  };
}