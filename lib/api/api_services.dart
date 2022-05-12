import 'dart:convert';

import 'package:cleon_mobile/models/user.dart';
import 'package:cleon_mobile/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final storage = FlutterSecureStorage();
  String token = '';

  void getToken() async {
    token = (await storage.read(key: 'token'))!;
  }

  Future<List<User>> getUser() async {
    List<User> user = <User>[];
    getToken();
    final response = await http.post(Uri.parse('$API/details'),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        user.add(User.fromJson(data[i]));
      }
      return user;
    } else {
      throw Exception('Gagal Mendapatkan Data');
    }
  }
}
