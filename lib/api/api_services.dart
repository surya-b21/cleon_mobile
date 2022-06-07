import 'dart:convert';

import 'package:cleon_mobile/models/riwayat.dart';
import 'package:cleon_mobile/models/transaksi.dart';
import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';

import '../models/paket.dart';

class ApiServices {
  final storage = const FlutterSecureStorage();
  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    return token;
  }

  Future<User> getUser() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse('$API/details'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Mendapatkan Data');
    }
  }

  Future<List<Paket>> getPaket(int? idJenis) async {
    String? token = await getToken();
    final response = await http.get(
        Uri.parse('$API/getpaket?id_jenis=$idJenis'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final paket = paketFromJson(response.body);
      return paket;
    } else {
      throw Exception('Gagal mendapatkan data');
    }
  }

  Future<List<Riwayat>> getRiwayat() async {
    String? token = await getToken();
    final response = await http.get(Uri.parse("$API/getriwayat"),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final riwayat = riwayatFromJson(response.body);
      return riwayat;
    } else {
      throw Exception('gagal mendapatkan data');
    }
  }

  Future<void> pembayaran(String pembayaran, int harga, int idPaket) async {
    switch (pembayaran) {
      case 'gopay':
        await gopay(harga, idPaket);
        break;
      case 'qris':
        await qris(harga, idPaket);
        break;
      default:
        throw Exception("metode pembayaran tidak ada");
    }
  }

  Future<void> gopay(int harga, int idPaket) async {
    Map<String, dynamic> result;
    String? token = await getToken();
    final response = await http.post(
        Uri.parse("$API/gopay?harga=$harga&id_paket=$idPaket"),
        headers: {'Authorization': 'Bearer $token'});
    result = jsonDecode(response.body);

    if (result['status_code'] != "201") {
      throw Exception("invalid response");
    }
    if (!await launchUrlString(result['actions'][1]['url'],
        mode: LaunchMode.externalApplication)) {
      throw Exception("can't launch url");
    }
    return result['actions'][1]['url'];
  }

  Future<void> qris(int harga, int idPaket) async {
    Map<String, dynamic> result;
    String? token = await getToken();
    final response = await http.post(
        Uri.parse("$API/gopay?harga=$harga&id_paket=$idPaket"),
        headers: {'Authorization': 'Bearer $token'});
    result = jsonDecode(response.body);

    if (result['status_code'] != "201") {
      throw Exception("invalid response");
    }
    if (!await launchUrlString(result['actions'][0]['url'],
        mode: LaunchMode.externalApplication)) {
      throw Exception("can't show qr code");
    }
  }

  Future<Transaksi> requestPaket(int idPaket) async {
    String? token = await getToken();
    final response = await http.post(Uri.parse("$API/create-riwayat"),
        headers: {'Authorization': 'Bearer $token'},
        body: {"id_paket": idPaket.toString()});
    if (response.statusCode != 201) {
      throw Exception("invalid request");
    }
    return Transaksi.fromJson(jsonDecode(response.body));
  }
}
