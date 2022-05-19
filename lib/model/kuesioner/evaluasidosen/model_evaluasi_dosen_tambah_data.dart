
import 'dart:convert';

class ModelEvaluasiDosenTambahData {
  ModelEvaluasiDosenTambahData({
    required this.klsId,
    required this.nim,
    required this.jawabanKuisioner,
    required this.saran,
  });

  String klsId;
  final String nim;
  List<EvaluasiJawabanKuisioner>? jawabanKuisioner;
  List<Saran>? saran;

  factory ModelEvaluasiDosenTambahData.fromJson(String str) => ModelEvaluasiDosenTambahData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelEvaluasiDosenTambahData.fromMap(Map<String, dynamic> json) => ModelEvaluasiDosenTambahData(
    klsId: json["klsId"] == null ? null : json["klsId"],
    nim: json["nim"] == null ? null : json["nim"],
    jawabanKuisioner: json["jawabanKuisioner"] == null ? null : List<EvaluasiJawabanKuisioner>.from(json["jawabanKuisioner"].map((x) => EvaluasiJawabanKuisioner.fromMap(x))),
    saran: json["saran"] == null ? null : List<Saran>.from(json["saran"].map((x) => Saran.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "klsId": klsId == null ? null : klsId,
    "nim": nim == null ? null : nim,
    "jawabanKuisioner": jawabanKuisioner == null ? null : List<dynamic>.from(jawabanKuisioner!.map((x) => x.toMap())),
    "saran": saran == null ? null : List<dynamic>.from(saran!.map((x) => x.toMap())),
  };
}

class EvaluasiJawabanKuisioner {
  EvaluasiJawabanKuisioner({
    required this.nipDosen,
    required this.bobot,
    required this.idSoal,
  });

  String nipDosen;
  String bobot;
  String idSoal;

  factory EvaluasiJawabanKuisioner.fromJson(String str) => EvaluasiJawabanKuisioner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EvaluasiJawabanKuisioner.fromMap(Map<String, dynamic> json) => EvaluasiJawabanKuisioner(
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

  String nipDosen;
  String saranData;

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
