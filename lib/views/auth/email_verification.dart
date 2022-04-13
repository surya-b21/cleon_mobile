// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2E41),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoSims(),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(8),
              width: 350,
              height: 170,
              decoration: BoxDecoration(
                  color: Color(0xff9eb9e8),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.25),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(1, 7),
                    )
                  ]),
              child: Column(
                children: [
                  Text(
                    "Link verifikasi telah dikirim di email anda, silahkan cek email anda untuk mengverifikasi email anda. Jika pesan tidak ditemukan, silahkan tekan tombol dibawah",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xff867EBA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Kirim Link Verifikasi Ulang",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
