// To parse this JSON data, do
//
//     final modelUserMahasiswaPaketSemester = modelUserMahasiswaPaketSemesterFromMap(jsonString);

import 'dart:convert';

class ModelUserMahasiswaPaketSemester {
  ModelUserMahasiswaPaketSemester({
    required this.data,
  });

  final Map<String, String>? data;

  factory ModelUserMahasiswaPaketSemester.fromJson(String str) =>
      ModelUserMahasiswaPaketSemester.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ModelUserMahasiswaPaketSemester.fromMap(Map<String, dynamic> json) =>
      ModelUserMahasiswaPaketSemester(
        data: json["data"] == null
            ? null
            : Map.from(json["data"])
                .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
