// ignore_for_file: unused_field

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();

  static const _clientIdWeb = '1';

  static const _clientSecret = '425SBi6jSRT6aCMDZdmZG8n3nmSnqN9q3ng5fRQB';
}
