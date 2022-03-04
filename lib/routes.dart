import 'package:cleon_mobile/views/dashboard.dart';
import 'package:cleon_mobile/views/signin.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.arguments) {
      case '/':
        return MaterialPageRoute(builder: (_) => Dashboard());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text("Not Found")),
                ));
    }
  }
}
