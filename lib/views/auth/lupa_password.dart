// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';

class LupaPassword extends StatefulWidget {
  const LupaPassword({Key? key}) : super(key: key);

  @override
  State<LupaPassword> createState() => _LupaPasswordState();
}

class _LupaPasswordState extends State<LupaPassword> {
  bool state = true;

  final userRepository = UserRepository();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2E41),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoSims(),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 40),
              child: Text(
                "Silahkan masukkan email, setelah itu silahkan cek inbox email anda",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
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
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            state
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff867EBA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          state = false;
                        });
                        bool status = await userRepository
                            .lupaPassword(_emailController.text);
                        if (status) {
                          setState(() {
                            state = status;
                          });
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "Silahkan cek email anda",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.green,
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  )
                : CircularProgressIndicator(
                    color: Colors.white,
                  )
          ],
        ),
      ),
    );
  }
}
