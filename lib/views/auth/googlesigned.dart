import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigned extends StatelessWidget {
  final GoogleSignInAccount user;
  const GoogleSigned({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nama : " + user.displayName.toString()),
            Text("Email : " + user.email.toString())
          ],
        ),
      ),
    );
  }
}
