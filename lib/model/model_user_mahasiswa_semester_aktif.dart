import 'dart:convert';

class UserModelSemesterAktif {
  UserModelSemesterAktif({
    required this.rows,
    required this.limit,
    required this.offset,
  });

  final List<Row>? rows;
  final int limit;
  final int offset;

  factory UserModelSemesterAktif.fromJson(String str) =>
      UserModelSemesterAktif.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModelSemesterAktif.fromMap(Map<String, dynamic> json) =>
      UserModelSemesterAktif(
        rows: json["rows"] == null
            ? null
            : List<Row>.from(json["rows"].map((x) => Row.fromMap(x))),
        limit: json["limit"] == null ? null : json["limit"],
        offset: json["offset"] == null ? null : json["offset"],
      );

  Map<String, dynamic> toMap() => {
        "rows": rows == null
            ? null
            : List<dynamic>.from(rows!.map((x) => x.toMap())),
        "limit": limit == null ? null : limit,
        "offset": offset == null ? null : offset,
      };
}

class Row {
  Row({
    required this.kode,
    required this.semesterAktif,
    required this.createdAt,
    required this.updateAt,
    required this.semester,
    required this.namaSemester,
  });

  final String kode;
  final String semesterAktif;
  final DateTime? createdAt;
  final DateTime? updateAt;
  final Semester? semester;
  final NamaSemester? namaSemester;

  factory Row.fromJson(String str) => Row.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Row.fromMap(Map<String, dynamic> json) => Row(
        kode: json["kode"] == null ? null : json["kode"],
        semesterAktif:
            json["semesterAktif"] == null ? null : json["semesterAktif"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updateAt:
            json["updateAt"] == null ? null : DateTime.parse(json["updateAt"]),
        semester: json["semester"] == null
            ? null
            : Semester.fromMap(json["semester"]),
        namaSemester: json["namaSemester"] == null
            ? null
            : NamaSemester.fromMap(json["namaSemester"]),
      );

  Map<String, dynamic> toMap() => {
        "kode": kode == null ? null : kode,
        "semesterAktif": semesterAktif == null ? null : semesterAktif,
        "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
        "updateAt": updateAt == null ? null : updateAt?.toIso8601String(),
        "semester": semester == null ? null : semester?.toMap(),
        "namaSemester": namaSemester == null ? null : namaSemester?.toMap(),
      };
}

class NamaSemester {
  NamaSemester({
    required this.kode,
    required this.nama,
    required this.jenis,
    required this.urutan,
    required this.namaSingkat,
  });

  final int kode;
  final String nama;
  final String jenis;
  final int urutan;
  final String namaSingkat;

  factory NamaSemester.fromJson(String str) =>
      NamaSemester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NamaSemester.fromMap(Map<String, dynamic> json) => NamaSemester(
        kode: json["kode"] == null ? null : json["kode"],
        nama: json["nama"] == null ? null : json["nama"],
        jenis: json["jenis"] == null ? null : json["jenis"],
        urutan: json["urutan"] == null ? null : json["urutan"],
        namaSingkat: json["namaSingkat"] == null ? null : json["namaSingkat"],
      );

  Map<String, dynamic> toMap() => {
        "kode": kode == null ? null : kode,
        "nama": nama == null ? null : nama,
        "jenis": jenis == null ? null : jenis,
        "urutan": urutan == null ? null : urutan,
        "namaSingkat": namaSingkat == null ? null : namaSingkat,
      };
}

class Semester {
  Semester({
    required this.kode,
    required this.tahun,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.kodeNamaSemester,
  });

  final int kode;
  final int tahun;
  final DateTime? tanggalMulai;
  final DateTime? tanggalSelesai;
  final int kodeNamaSemester;

  factory Semester.fromJson(String str) => Semester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Semester.fromMap(Map<String, dynamic> json) => Semester(
        kode: json["kode"] == null ? null : json["kode"],
        tahun: json["tahun"] == null ? null : json["tahun"],
        tanggalMulai: json["tanggalMulai"] == null
            ? null
            : DateTime.parse(json["tanggalMulai"]),
        tanggalSelesai: json["tanggalSelesai"] == null
            ? null
            : DateTime.parse(json["tanggalSelesai"]),
        kodeNamaSemester:
            json["kodeNamaSemester"] == null ? null : json["kodeNamaSemester"],
      );

  Map<String, dynamic> toMap() => {
        "kode": kode == null ? null : kode,
        "tahun": tahun == null ? null : tahun,
        "tanggalMulai": tanggalMulai == null
            ? null
            : "${tanggalMulai?.year.toString().padLeft(4, '0')}-${tanggalMulai?.month.toString().padLeft(2, '0')}-${tanggalMulai?.day.toString().padLeft(2, '0')}",
        "tanggalSelesai": tanggalSelesai == null
            ? null
            : "${tanggalSelesai?.year.toString().padLeft(4, '0')}-${tanggalSelesai?.month.toString().padLeft(2, '0')}-${tanggalSelesai?.day.toString().padLeft(2, '0')}",
        "kodeNamaSemester": kodeNamaSemester == null ? null : kodeNamaSemester,
      };
}
