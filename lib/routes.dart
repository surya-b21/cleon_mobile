// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/app.dart';
import 'package:cleon_mobile/repositories/user_repositories.dart';
import 'package:cleon_mobile/views/dashboard.dart';
import 'package:cleon_mobile/views/home.dart';
import 'package:cleon_mobile/views/kontak.dart';
import 'package:cleon_mobile/views/others.dart';
import 'package:cleon_mobile/views/shop/shop.dart';
import 'package:cleon_mobile/views/signin.dart';
import 'package:cleon_mobile/views/signup.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  final _userRepository = UserRepository();

  Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Dashboard(
                  userRepository: _userRepository,
                ));
      case '/signin':
        return MaterialPageRoute(
            builder: (_) => SignIn(
                  userRepository: _userRepository,
                ));
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/app':
        return MaterialPageRoute(builder: (_) => App());
      case '/shop':
        return MaterialPageRoute(builder: (_) => Shop());
      case '/others':
        return MaterialPageRoute(builder: (_) => Others());
      case '/kontak':
        return MaterialPageRoute(builder: (_) => Kontak());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text("Not Found")),
                ));
    }
  }
}
