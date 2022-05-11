
import 'dart:convert';

class ModelEvaluasiDosenTambahData {
  ModelEvaluasiDosenTambahData({
    required this.klsId,
    required this.nim,
    required this.jawabanKuisioner,
    required this.saran,
  });

  final String klsId;
  final String nim;
  final List<JawabanKuisioner>? jawabanKuisioner;
  final List<Saran>? saran;

  factory ModelEvaluasiDosenTambahData.fromJson(String str) => ModelEvaluasiDosenTambahData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEvaluasiDosenTambahData.fromMap(Map<String, dynamic> json) => ModelEvaluasiDosenTambahData(
    klsId: json["klsId"] == null ? null : json["klsId"],
    nim: json["nim"] == null ? null : json["nim"],
    jawabanKuisioner: json["jawabanKuisioner"] == null ? null : List<JawabanKuisioner>.from(json["jawabanKuisioner"].map((x) => JawabanKuisioner.fromMap(x))),
    saran: json["saran"] == null ? null : List<Saran>.from(json["saran"].map((x) => Saran.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "nim": nim == null ? null : nim,
    "jawabanKuisioner": jawabanKuisioner == null ? null : List<dynamic>.from(jawabanKuisioner!.map((x) => x.toMap())),
    "saran": saran == null ? null : List<dynamic>.from(saran!.map((x) => x.toMap())),
  };
}

class JawabanKuisioner {
  JawabanKuisioner({
    required this.nipDosen,
    required this.bobot,
    required this.idSoal,
  });

  final String nipDosen;
  final String bobot;
  final String idSoal;

  factory JawabanKuisioner.fromJson(String str) => JawabanKuisioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JawabanKuisioner.fromMap(Map<String, dynamic> json) => JawabanKuisioner(
    nipDosen: json["nipDosen"] == null ? null : json["nipDosen"],
    bobot: json["bobot"] == null ? null : json["bobot"],
    idSoal: json["idSoal"] == null ? null : json["idSoal"],
  );

  Map<String, dynamic> toMap() => {
    "nipDosen": nipDosen == null ? null : nipDosen,
    "bobot": bobot == null ? null : bobot,
    "idSoal": idSoal == null ? null : idSoal,
  };
}

class Saran {
  Saran({
    required this.nipDosen,
    required this.saranData,
  });

  final String nipDosen;
  final String saranData;

  factory Saran.fromJson(String str) => Saran.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Saran.fromMap(Map<String, dynamic> json) => Saran(
    nipDosen: json["nipDosen"] == null ? null : json["nipDosen"],
    saranData: json["saranData"] == null ? null : json["saranData"],
  );

  Map<String, dynamic> toMap() => {
    "nipDosen": nipDosen == null ? null : nipDosen,
    "saranData": saranData == null ? null : saranData,
  };
}
