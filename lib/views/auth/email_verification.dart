// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/bloc/email_verification_bloc.dart';
import 'package:cleon_mobile/utils/logo.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    initDynamicLink();
  }

  void initDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      Uri link = event.link;
      BlocProvider.of<EmailVerificationBloc>(context)
          .add(VerifyingEmail(uri: link));
      Navigator.pop(context);
    });
  }

  // void handleLinkData(PendingDynamicLinkData data) {
  //   final Uri? uri = data.link;
  //   print(data.link.toString());
  //   if (uri != null) {
  //     final queryParams = uri.queryParameters;
  //     if (queryParams.isNotEmpty) {
  //       String? userName = queryParams["username"];
  //       // verify the username is parsed correctly
  //       print("My users username is: $userName");
  //     }
  //   }
  // }
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
                      onPressed: () {
                        BlocProvider.of<EmailVerificationBloc>(context)
                            .add(SendVerificationLink());
                      },
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
