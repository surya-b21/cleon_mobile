import 'dart:convert';

import 'package:cleon_mobile/models/riwayat.dart';
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

  Future<String> gopay(int harga) async {
    Map<String, dynamic> result;
    String? token = await getToken();
    final response = await http.post(Uri.parse("$API/gopay?harga=$harga"),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      result = jsonDecode(response.body);
      // print(result['actions'][0]['url']);
      if (!await launchUrlString(result['actions'][1]['url'],
          mode: LaunchMode.externalApplication)) {
        throw Exception("can't launch url");
      }
      return result['actions'][1]['url'];
    }

    return '';
  }

  Future<String> pembayaran(String pembayaran, int harga) async {
    late String result;
    switch (pembayaran) {
      case 'gopay':
        result = await gopay(harga);
        break;
      case 'alfamart':
        break;
      case 'indomaret':
        break;
      default:
        result = 'metode pembayaran tidak ada';
    }

    return result;
  }
}
