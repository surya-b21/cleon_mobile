// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/routes.dart';
import 'package:cleon_mobile/views/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleon Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      onGenerateRoute: Routes.generate,
    );
  }
}
