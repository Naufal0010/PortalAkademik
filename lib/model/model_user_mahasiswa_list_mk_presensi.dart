import 'dart:convert';

class UserMhsListMkPresensi {
  UserMhsListMkPresensi({
    required this.data,
  });

  final List<DataPresensi>? data;

  factory UserMhsListMkPresensi.fromJson(String str) => UserMhsListMkPresensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMhsListMkPresensi.fromMap(List json) => UserMhsListMkPresensi(
    data: json == null ? null : List<DataPresensi>.from(json.map((x) => DataPresensi.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class DataPresensi {
  DataPresensi({
    required this.kodePertemuan,
    required this.kodePresensi,
    required this.nim,
    required this.noPertemuan,
    required this.pokokBahasan,
    required this.tglPertemuan,
    required this.tglPertemuanPlain,
    required this.ismandiri,
    required this.jenisPresensi,
    required this.tglMulaiPresensi,
    required this.tglMulaiPresensiPlain,
    required this.tglSelesaiPresensi,
    required this.tglSelesaiPresensiPlain,
    required this.isfinal,
    required this.keterangan,
    required this.isbisaabsen,
    required this.aksi,
    required this.dosenAmpu,
  });

  final String kodePertemuan;
  final dynamic kodePresensi;
  final dynamic nim;
  final String noPertemuan;
  final String pokokBahasan;
  final String tglPertemuan;
  final DateTime? tglPertemuanPlain;
  final String? ismandiri;
  final String jenisPresensi;
  final String tglMulaiPresensi;
  final dynamic tglMulaiPresensiPlain;
  final String tglSelesaiPresensi;
  final dynamic tglSelesaiPresensiPlain;
  final dynamic isfinal;
  final String keterangan;
  final dynamic isbisaabsen;
  final String aksi;
  final String dosenAmpu;

  factory DataPresensi.fromJson(String str) => DataPresensi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataPresensi.fromMap(Map<String, dynamic> json) => DataPresensi(
    kodePertemuan: json["kode_pertemuan"] == null ? null : json["kode_pertemuan"],
    kodePresensi: json["kode_presensi"],
    nim: json["nim"],
    noPertemuan: json["no_pertemuan"] == null ? null : json["no_pertemuan"],
    pokokBahasan: json["pokok_bahasan"] == null ? null : json["pokok_bahasan"],
    tglPertemuan: json["tgl_pertemuan"] == null ? null : json["tgl_pertemuan"],
    tglPertemuanPlain: json["tgl_pertemuan_plain"] == null ? null : DateTime.parse(json["tgl_pertemuan_plain"]),
    ismandiri: json["ismandiri"] == null ? null : json["ismandiri"],
    jenisPresensi: json["jenis_presensi"] == null ? null : json["jenis_presensi"],
    tglMulaiPresensi: json["tgl_mulai_presensi"] == null ? null : json["tgl_mulai_presensi"],
    tglMulaiPresensiPlain: json["tgl_mulai_presensi_plain"],
    tglSelesaiPresensi: json["tgl_selesai_presensi"] == null ? null : json["tgl_selesai_presensi"],
    tglSelesaiPresensiPlain: json["tgl_selesai_presensi_plain"],
    isfinal: json["isfinal"],
    keterangan: json["keterangan"] == null ? null : json["keterangan"],
    isbisaabsen: json["isbisaabsen"],
    aksi: json["aksi"] == null ? null : json["aksi"],
    dosenAmpu: json["dosen_ampu"] == null ? null : json["dosen_ampu"],
  );

  Map<String, dynamic> toMap() => {
    "kode_pertemuan": kodePertemuan == null ? null : kodePertemuan,
    "kode_presensi": kodePresensi,
    "nim": nim,
    "no_pertemuan": noPertemuan == null ? null : noPertemuan,
    "pokok_bahasan": pokokBahasan == null ? null : pokokBahasan,
    "tgl_pertemuan": tglPertemuan == null ? null : tglPertemuan,
    "tgl_pertemuan_plain": tglPertemuanPlain == null ? null : "${tglPertemuanPlain?.year.toString().padLeft(4, '0')}-${tglPertemuanPlain?.month.toString().padLeft(2, '0')}-${tglPertemuanPlain?.day.toString().padLeft(2, '0')}",
    "ismandiri": ismandiri == null ? null : ismandiri,
    "jenis_presensi": jenisPresensi == null ? null : jenisPresensi,
    "tgl_mulai_presensi": tglMulaiPresensi == null ? null : tglMulaiPresensi,
    "tgl_mulai_presensi_plain": tglMulaiPresensiPlain,
    "tgl_selesai_presensi": tglSelesaiPresensi == null ? null : tglSelesaiPresensi,
    "tgl_selesai_presensi_plain": tglSelesaiPresensiPlain,
    "isfinal": isfinal,
    "keterangan": keterangan == null ? null : keterangan,
    "isbisaabsen": isbisaabsen,
    "aksi": aksi == null ? null : aksi,
    "dosen_ampu": dosenAmpu == null ? null : dosenAmpu,
  };
}
