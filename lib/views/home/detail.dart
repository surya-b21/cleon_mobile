// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2F2E41),
        title: const Text("Detail Paket"),
      ),
      backgroundColor: const Color(0xffdedede),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [const Text("Cara Penggunaan Paket")],
        ),
      ),
    );
  }
}
