// To parse this JSON data, do
//
//     final riwayat = riwayatFromJson(jsonString);

import 'dart:convert';

List<Riwayat> riwayatFromJson(String str) =>
    List<Riwayat>.from(json.decode(str).map((x) => Riwayat.fromJson(x)));

String riwayatToJson(List<Riwayat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Riwayat {
  Riwayat({
    required this.id,
    required this.idUser,
    required this.idPaket,
    required this.username,
    required this.password,
    required this.createdAt,
    required this.nama,
    required this.keterangan,
  });

  int id;
  int idUser;
  int idPaket;
  String username;
  String password;
  DateTime createdAt;
  String nama;
  String keterangan;

  factory Riwayat.fromJson(Map<String, dynamic> json) => Riwayat(
        id: json["id"],
        idUser: json["id_user"],
        idPaket: json["id_paket"],
        username: json["username"],
        password: json["password"],
        createdAt: DateTime.parse(json["created_at"]),
        nama: json["nama"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "id_paket": idPaket,
        "username": username,
        "password": password,
        "created_at": createdAt.toIso8601String(),
        "nama": nama,
        "keterangan": keterangan,
      };
}
