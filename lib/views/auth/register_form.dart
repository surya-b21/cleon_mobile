// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/bloc/register_bloc.dart';
import 'package:cleon_mobile/cubit/dashboard_cubit.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/logo.dart';

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;
  const RegisterForm({Key? key, required this.userRepository})
      : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCOnfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailed) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Gagal Registrasi"),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(child: LogoSims()),
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
                              borderSide:
                                  BorderSide(color: Color(0xff867EBA)))),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
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
                              borderSide:
                                  BorderSide(color: Color(0xff867EBA)))),
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
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
                              borderSide:
                                  BorderSide(color: Color(0xff867EBA)))),
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
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
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
                              borderSide:
                                  BorderSide(color: Color(0xff867EBA)))),
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
                    height: 40,
                  ),
                  Align(
                    child: SizedBox(
                      width: 100,
                      height: 45,
                      child: state is RegisterLoading
                          ? CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff867EBA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterButtonPressed(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        password_confirmation:
                                            _passwordCOnfirmationController
                                                .text),
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    child: SizedBox(
                      width: 250,
                      height: 45,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {},
                        label: Text(
                          "Masuk dengan akun google",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google,
                            color: Color(0xffdb3236)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "Sudah punya akun ?",
                      style: TextStyle(color: Colors.white),
                    ),
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
        },
      ),
    );
  }
}
