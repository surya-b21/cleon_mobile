// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:cleon_mobile/utils/constant.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:device_info_plus/device_info_plus.dart';

class UserRepository {
  final storage = const FlutterSecureStorage();

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
    // await storage.write(key: 'token', value: token['token']);
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

  Future<void> saveToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<bool> hasToken() async {
    var token = await storage.read(key: 'token');

    if (token != null) {
      return true;
    }

    return false;
  }

  Future<bool> logout() async {
    String? token = await storage.read(key: 'token');

    final response = await http.post(Uri.parse("$API/logout"),
        headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      await storage.delete(key: 'token');
      await storage.deleteAll();
      return true;
    }

    return false;
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
    String? token = await storage.read(key: 'token');

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
    String? token = await storage.read(key: 'token');

    await http.get(uri, headers: {'Authorization': 'Bearer $token'});
  }

  Future<String> gantiPassword(String password, String password_confirmation,
      String password_lama) async {
    String? token = await storage.read(key: 'token');
    final response =
        await http.post(Uri.parse("$API/ganti-password"), headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      "password": password,
      "password_confirmation": password_confirmation,
      "password_lama": password_lama
    });

    Map<String, dynamic> message = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return message['status'];
    }

    return message['error'];
  }
}
