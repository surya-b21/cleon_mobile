// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/api/google_signin_api.dart';
import 'package:cleon_mobile/bloc/login_bloc.dart';
import 'package:cleon_mobile/api/user_repositories.dart';
import 'package:cleon_mobile/utils/logo.dart';
import 'package:cleon_mobile/views/auth/lupa_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubit/dashboard_cubit.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  const LoginForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Gagal Login"),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoSims(),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: false,
                    controller: _passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: const InputDecoration(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'field tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: state is LoginLoading
                      ? const CupertinoActivityIndicator(
                          color: Colors.white,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xff867EBA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginButtonPressed(
                                      email: _emailController.text,
                                      password: _passwordController.text));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 250,
                  height: 45,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () async {
                      await GoogleSignInApi.login();
                    },
                    label: Text(
                      "Masuk dengan akun google",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google,
                        color: Color(0xffdb3236)),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LupaPassword()));
                    },
                    child: Text(
                      "Lupa Password",
                    )),
                const Text(
                  "Belum punya akun ?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    context.read<DashboardCubit>().signUp();
                  },
                  child: const Text("Registrasi disini"),
                ),
                // TextButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (_) => EmailVerification()));
                //     },
                //     child: Text('Email Verif'))
              ],
            ),
          );
        },
      ),
    );
  }
}
