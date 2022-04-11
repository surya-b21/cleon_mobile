import 'dart:convert';

import 'package:cleon_mobile/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<String> register(String name, String email, String password,
      String password_confirmation) async {
    final response = await http.post(Uri.parse('$API/register'), body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation
    });

    Map<String, dynamic> token = jsonDecode(response.body);
    return token['token'];
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(Uri.parse('$API/login'),
        body: {"email": email, "password": password});

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
