// ignore_for_file: file_names, prefer_const_constructors

import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:flutter/material.dart';

class GantiPassword extends StatefulWidget {
  const GantiPassword({Key? key}) : super(key: key);

  @override
  State<GantiPassword> createState() => _GantiPasswordState();
}

class _GantiPasswordState extends State<GantiPassword> {
  final _userRepository = UserRepository();
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _passwordLamaController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2A2F4A),
        title: Text("Ganti Password"),
      ),
      backgroundColor: Color(0xffdedede),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordLamaController,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Masukkan password lama anda",
                    hintStyle: TextStyle(color: Colors.black54),
                    labelText: "Password Lama",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff2A2F4A)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  if (value.length < 8) {
                    return 'minimal 8 karakter';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Masukkan password anda",
                    hintStyle: TextStyle(color: Colors.black54),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff2A2F4A)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  if (value.length < 8) {
                    return 'minimal 8 karakter';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextFormField(
                controller: _passwordConfirmationController,
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Ketik ulang password anda",
                    hintStyle: TextStyle(color: Colors.black54),
                    labelText: "Keting ulang Password",
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.black,
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff2A2F4A)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'field tidak boleh kosong';
                  }
                  if (value.length < 8) {
                    return 'minimal 8 karakter';
                  }
                  if (value != _passwordController.text) {
                    return 'password tidak sama';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2A2F4A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Ganti Password"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String pesan = await _userRepository.gantiPassword(
                        _passwordController.text,
                        _passwordConfirmationController.text,
                        _passwordLamaController.text);
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(pesan),
                        backgroundColor: Color(0xff2A2F4A),
                      ));
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
