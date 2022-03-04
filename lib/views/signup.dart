import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Masukkan nama anda",
                    hintStyle: TextStyle(color: Colors.white30),
                    labelText: "Nama",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.people,
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
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Masukkan password anda",
                    hintStyle: TextStyle(color: Colors.white30),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.password,
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
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Ketik ulang password anda",
                    hintStyle: TextStyle(color: Colors.white30),
                    labelText: "Keting ulang Password",
                    labelStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.password,
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
              height: 40,
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
                child: Text(
                  'Daftar',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Sudah punya akun ?",
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text('Login disini'))
          ],
        ),
      ),
    );
  }
}
