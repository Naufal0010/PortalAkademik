import 'dart:convert';

class ModelPelayananUlmTambahData {
  ModelPelayananUlmTambahData({
    required this.nim,
    required this.pendapat,
    required this.jawabanKuisioner,
  });

  final String nim;
  String pendapat;
  List<JawabanKuisioner>? jawabanKuisioner;

  factory ModelPelayananUlmTambahData.fromJson(String str) => ModelPelayananUlmTambahData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelPelayananUlmTambahData.fromMap(Map<String, dynamic> json) => ModelPelayananUlmTambahData(
    nim: json["nim"] == null ? null : json["nim"],
    pendapat: json["pendapat"] == null ? null : json["pendapat"],
    jawabanKuisioner: json["jawabanKuisioner"] == null ? null : List<JawabanKuisioner>.from(json["jawabanKuisioner"].map((x) => JawabanKuisioner.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "nim": nim == null ? null : nim,
    "pendapat": pendapat == null ? null : pendapat,
    "jawabanKuisioner": jawabanKuisioner == null ? null : List<dynamic>.from(jawabanKuisioner!.map((x) => x.toMap())),
  };
}

class JawabanKuisioner {
  JawabanKuisioner({
    required this.nilaiKategori,
    required this.idKategori,
    required this.kuisioner,
  });

   int nilaiKategori;
   String idKategori;
   List<DataKuesioner>? kuisioner;

  factory JawabanKuisioner.fromJson(String str) => JawabanKuisioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JawabanKuisioner.fromMap(Map<String, dynamic> json) => JawabanKuisioner(
    nilaiKategori: json["nilaiKategori"] == null ? null : json["nilaiKategori"],
    idKategori: json["idKategori"] == null ? null : json["idKategori"],
    kuisioner: json["kuisioner"] == null ? null : List<DataKuesioner>.from(json["kuisioner"].map((x) => DataKuesioner.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "nilaiKategori": nilaiKategori == null ? null : nilaiKategori,
    "idKategori": idKategori == null ? null : idKategori,
    "kuisioner": kuisioner == null ? null : List<dynamic>.from(kuisioner!.map((x) => x.toMap())),
  };
}

class DataKuesioner {
  DataKuesioner({
    required this.idSoal,
    required this.tipeSoal,
    required this.nilaiSoal,
  });

  String idSoal;
  int tipeSoal;
  int nilaiSoal;

  factory DataKuesioner.fromJson(String str) => DataKuesioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataKuesioner.fromMap(Map<String, dynamic> json) => DataKuesioner(
    idSoal: json["idSoal"] == null ? null : json["idSoal"],
    tipeSoal: json["tipeSoal"] == null ? null : json["tipeSoal"],
    nilaiSoal: json["nilaiSoal"] == null ? null : json["nilaiSoal"],
  );

  Map<String, dynamic> toMap() => {
    "idSoal": idSoal == null ? null : idSoal,
    "tipeSoal": tipeSoal == null ? null : tipeSoal,
    "nilaiSoal": nilaiSoal == null ? null : nilaiSoal,
  };
}
