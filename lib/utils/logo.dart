import 'package:flutter/material.dart';

class LogoSims extends StatelessWidget {
  const LogoSims({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: Color(0xff867EBA)),
          child: Text(
            " C L E O N ",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        Text(
          " B Y  S I M S",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      ],
    );
  }
}
