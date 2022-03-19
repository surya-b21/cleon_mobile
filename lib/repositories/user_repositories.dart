import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  var api = "https://reqres.in/api/login";

  Future<String> login(String email, String password) async {
    final response = await http
        .post(Uri.parse(api), body: {"email": email, "password": password});

    Map<String, dynamic> token = jsonDecode(response.body);
    return token['token'];
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("token");

    if (token != null) {
      return true;
    }

    return false;
  }

  deleteToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
