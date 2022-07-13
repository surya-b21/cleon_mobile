// To parse this JSON data, do
//
//     final paket = paketFromJson(jsonString);

import 'dart:convert';

List<Paket> paketFromJson(String str) =>
    List<Paket>.from(json.decode(str).map((x) => Paket.fromJson(x)));

String paketToJson(List<Paket> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Paket {
  Paket({
    required this.id,
    required this.idJenis,
    required this.nama,
    required this.harga,
    required this.speed,
    required this.aktif,
    required this.keterangan,
  });

  int id;
  int idJenis;
  String nama;
  int harga;
  double speed;
  int aktif;
  String keterangan;

  factory Paket.fromJson(Map<String, dynamic> json) => Paket(
        id: json["id"],
        idJenis: json["id_jenis"],
        nama: json["nama"],
        harga: json["harga"],
        speed: json["speed"].toDouble(),
        aktif: json["aktif"],
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_jenis": idJenis,
        "nama": nama,
        "harga": harga,
        "speed": speed,
        "aktif": aktif,
        "keterangan": keterangan,
      };
}
