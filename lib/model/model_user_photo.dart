import 'dart:convert';

class UserPhotoMahasiswa {
  UserPhotoMahasiswa({
    required this.foto,
  });

  final String foto;

  factory UserPhotoMahasiswa.fromJson(String str) => UserPhotoMahasiswa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserPhotoMahasiswa.fromMap(Map<String, dynamic> json) => UserPhotoMahasiswa(
    foto: json["foto"] == null ? null : json["foto"],
  );

  Map<String, dynamic> toMap() => {
    "foto": foto == null ? null : foto,
  };
}