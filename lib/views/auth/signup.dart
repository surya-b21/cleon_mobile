// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/dashboard_cubit.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCOnfirmationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F2E41),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.read<DashboardCubit>().back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
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
                controller: _nameController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: _emailController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  String pattern =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Silahkan masukkan email yang benar';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: _passwordController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: TextFormField(
                controller: _passwordCOnfirmationController,
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  return null;
                },
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
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
                  context.read<DashboardCubit>().signIn();
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/signin', (route) => false);
                },
                child: Text('Login disini'))
          ],
        ),
      ),
    );
  }
}
