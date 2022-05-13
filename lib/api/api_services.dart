import 'dart:convert';

import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final storage = const FlutterSecureStorage();
  Future<String?> getToken() async {
    String? token = await storage.read(key: 'token');
    return token;
  }

  Future<User> getUser() async {
    String? token = await getToken();
    print("jwt = $token");
    final response = await http.get(Uri.parse('$API/details'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal Mendapatkan Data');
    }
  }
}
