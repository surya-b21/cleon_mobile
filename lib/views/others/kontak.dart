// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Kontak extends StatelessWidget {
  const Kontak({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kontak"),
        backgroundColor: Color(0xff2F2E41),
      ),
      backgroundColor: Color(0xffdedede),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Marketing",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            Text(
              "+62-856-4314-5334 (Eksan)\n+62-856-4332-8070 (Dikky)\n+62-856-4388-5042 (Johan)\n+62-822-2598-8821 (Admin 1)\n+62-813-1415-2347 (Admin 2)",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
