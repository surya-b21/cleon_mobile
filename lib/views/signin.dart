// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2E41),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoSims(),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Masukkan email anda",
                    hintStyle: TextStyle(color: Colors.white30),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff867EBA)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Masukkan password",
                    hintStyle: TextStyle(color: Colors.white30),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff867EBA)))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 100,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff867EBA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Belum punya akun ?",
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Registrasi disini"),
            )
          ],
        ),
      ),
    );
  }
}
