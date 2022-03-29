import 'dart:convert';

class UserMhsHeaderKrs {
  UserMhsHeaderKrs({
    required this.dosenAmpu,
    required this.semester,
    required this.ips,
    required this.sksMax,
    required this.event,
    required this.isMerdeka,
    required this.krs,
  });

  final String dosenAmpu;
  final String semester;
  final String ips;
  final String sksMax;
  final String event;
  final String isMerdeka;
  final Krs? krs;

  factory UserMhsHeaderKrs.fromJson(String str) => UserMhsHeaderKrs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMhsHeaderKrs.fromMap(Map<String, dynamic> json) => UserMhsHeaderKrs(
    dosenAmpu: json["dosen_ampu"] == null ? null : json["dosen_ampu"],
    semester: json["semester"] == null ? null : json["semester"],
    ips: json["ips"] == null ? null : json["ips"],
    sksMax: json["sks_max"] == null ? null : json["sks_max"],
    event: json["event"] == null ? null : json["event"],
    isMerdeka: json["isMerdeka"] == null ? null : json["isMerdeka"],
    krs: json["krs"] == null ? null : Krs.fromMap(json["krs"]),
  );

  Map<String, dynamic> toMap() => {
    "dosen_ampu": dosenAmpu == null ? null : dosenAmpu,
    "semester": semester == null ? null : semester,
    "ips": ips == null ? null : ips,
    "sks_max": sksMax == null ? null : sksMax,
    "event": event == null ? null : event,
    "isMerdeka": isMerdeka == null ? null : isMerdeka,
    "krs": krs == null ? null : krs?.toMap(),
  };
}

class Krs {
  Krs({
    required this.komentar,
    required this.isSetujui,
    required this.isDikirim,
    required this.isDirevisi,
    required this.isSelesaiRevisi,
  });

  final List<Komentar>? komentar;
  final String isSetujui;
  final String isDikirim;
  final String isDirevisi;
  final String isSelesaiRevisi;

  factory Krs.fromJson(String str) => Krs.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Krs.fromMap(Map<String, dynamic> json) => Krs(
    komentar: json["komentar"] == null ? null : List<Komentar>.from(json["komentar"].map((x) => Komentar.fromMap(x))),
    isSetujui: json["isSetujui"] == null ? null : json["isSetujui"],
    isDikirim: json["isDikirim"] == null ? null : json["isDikirim"],
    isDirevisi: json["isDirevisi"] == null ? null : json["isDirevisi"],
    isSelesaiRevisi: json["isSelesaiRevisi"] == null ? null : json["isSelesaiRevisi"],
  );

  Map<String, dynamic> toMap() => {
    "komentar": komentar == null ? null : List<dynamic>.from(komentar!.map((x) => x.toMap())),
    "isSetujui": isSetujui == null ? null : isSetujui,
    "isDikirim": isDikirim == null ? null : isDikirim,
    "isDirevisi": isDirevisi == null ? null : isDirevisi,
    "isSelesaiRevisi": isSelesaiRevisi == null ? null : isSelesaiRevisi,
  };
}

class Komentar {
  Komentar({
    required this.teks,
    required this.tanggal,
  });

  final String teks;
  final String tanggal;

  factory Komentar.fromJson(String str) => Komentar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Komentar.fromMap(Map<String, dynamic> json) => Komentar(
    teks: json["teks"] == null ? null : json["teks"],
    tanggal: json["tanggal"] == null ? null : json["tanggal"],
  );

  Map<String, dynamic> toMap() => {
    "teks": teks == null ? null : teks,
    "tanggal": tanggal == null ? null : tanggal,
  };
}