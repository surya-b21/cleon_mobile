// ignore_for_file: unused_field
import 'dart:convert';

import 'package:cleon_mobile/utils/constant.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn(scopes: [
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile'
  ]);

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();

  static Future<String> getToken(String? accessToken) async {
    final response = await http.post(Uri.parse("$WEB/oauth/token"), body: {
      "grant_type": "social",
      "client_id": clientIdWeb,
      "client_secret": clientSecret,
      "provider": "google",
      "access_token": accessToken
    });

    if (response.statusCode != 200) {
      throw Exception("Invalid Request");
    }

    Map<String, dynamic> result = jsonDecode(response.body);
    return result["access_token"];
  }
}
