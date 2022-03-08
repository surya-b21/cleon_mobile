// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/views/app.dart';
import 'package:cleon_mobile/views/dashboard.dart';
import 'package:cleon_mobile/views/home.dart';
import 'package:cleon_mobile/views/signin.dart';
import 'package:cleon_mobile/views/signup.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/app':
        return MaterialPageRoute(builder: (_) => App());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text("Not Found")),
                ));
    }
  }
}
