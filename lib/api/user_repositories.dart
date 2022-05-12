// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:cleon_mobile/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UserRepository {
  Future<String> register(String name, String email, String password,
      String password_confirmation) async {
    final response = await http.post(Uri.parse('$API/register'), body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "device_id": await getDeviceId()
    });

    Map<String, dynamic> token = jsonDecode(response.body);
    return token['token'];
  }

  Future<String> login(String email, String password) async {
    final response = await http.post(Uri.parse('$API/login'), body: {
      "email": email,
      "password": password,
      "device_id": await getDeviceId()
    });

    Map<String, dynamic> token = jsonDecode(response.body);
    return token['token'];
  }

  getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        return androidInfo.androidId;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        return iosInfo.identifierForVendor;
      }
    } on PlatformException {
      throw ('Gagal mendapatkan ID device');
    }
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

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    await http.post(Uri.parse("$API/logout"),
        headers: {'Authorization': 'Bearer $token'});

    await prefs.clear();
  }

  Future<bool> lupaPassword(String email) async {
    final response = await http
        .post(Uri.parse("$API/forgot-password"), body: {'email': email});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> cekVerifikasiEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final response = await http.post(
        Uri.parse("$API/email/verification-notification"),
        headers: {'Authorization': 'Bearer $token'});

    Map<String, dynamic> details = jsonDecode(response.body);

    if (details['pesan'] == 'terverifikasi') {
      return true;
    }

    return false;
  }

  Future<void> verifyEmail(Uri uri) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    await http.get(uri, headers: {'Authorization': 'Bearer $token'});
  }
}
