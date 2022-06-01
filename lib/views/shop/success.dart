import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pembayaran Sukses'),
        backgroundColor: Color(0xff2F2E41),
      ),
      backgroundColor: Color(0xffdedede),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
