import 'dart:convert';

class UserModelRekapHasilStudi {
  UserModelRekapHasilStudi({
    required this.transkrip,
    required this.sksTotal,
    required this.sksLulus,
    required this.bobotTotal,
    required this.ipk,
  });

  final List<Transkrip>? transkrip;
  final int sksTotal;
  final int sksLulus;
  final double bobotTotal;
  final String ipk;

  factory UserModelRekapHasilStudi.fromJson(String str) => UserModelRekapHasilStudi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelRekapHasilStudi.fromMap(Map<String, dynamic> json) => UserModelRekapHasilStudi(
    transkrip: json["transkrip"] == null ? null : List<Transkrip>.from(json["transkrip"].map((x) => Transkrip.fromMap(x))),
    sksTotal: json["sks_total"] == null ? null : json["sks_total"],
    sksLulus: json["sks_lulus"] == null ? null : json["sks_lulus"],
    bobotTotal: json["bobot_total"] == null ? null : json["bobot_total"].toDouble(),
    ipk: json["IPK"] == null ? null : json["IPK"],
  );

  Map<String, dynamic> toMap() => {
    "transkrip": transkrip == null ? null : List<dynamic>.from(transkrip!.map((x) => x.toMap())),
    "sks_total": sksTotal == null ? null : sksTotal,
    "sks_lulus": sksLulus == null ? null : sksLulus,
    "bobot_total": bobotTotal == null ? null : bobotTotal,
    "IPK": ipk == null ? null : ipk,
  };
}

class Transkrip {
  Transkrip({
    required this.no,
    required this.kodeMk,
    required this.w,
    required this.namaMk,
    required this.sks,
    required this.sksbobot,
    required this.nilai,
  });

  final int no;
  final String kodeMk;
  final String w;
  final String namaMk;
  final String sks;
  final String sksbobot;
  final String nilai;

  factory Transkrip.fromJson(String str) => Transkrip.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Transkrip.fromMap(Map<String, dynamic> json) => Transkrip(
    no: json["no"] == null ? null : json["no"],
    kodeMk: json["kodeMk"] == null ? null : json["kodeMk"],
    w: json["w"] == null ? null : json["w"],
    namaMk: json["namaMk"] == null ? null : json["namaMk"],
    sks: json["sks"] == null ? null : json["sks"],
    sksbobot: json["sksbobot"].toString(),
    nilai: json["nilai"] == null ? null : json["nilai"],
  );

  Map<String, dynamic> toMap() => {
    "no": no == null ? null : no,
    "kodeMk": kodeMk == null ? null : kodeMk,
    "w": w == null ? null : w,
    "namaMk": namaMk == null ? null : namaMk,
    "sks": sks == null ? null : sks,
    "sksbobot": sksbobot,
    "nilai": nilai == null ? null : nilai,
  };
}
