// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Kuota extends StatefulWidget {
  const Kuota({Key? key}) : super(key: key);

  @override
  State<Kuota> createState() => _KuotaState();
}

class _KuotaState extends State<Kuota> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Paket Kuota"),
    );
  }
}
