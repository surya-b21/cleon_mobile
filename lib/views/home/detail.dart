import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F2E41),
        title: Text("Detail Paket"),
      ),
      backgroundColor: Color(0xffdedede),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [Text("Cara Penggunaan Paket")],
        ),
      ),
    );
  }
}
