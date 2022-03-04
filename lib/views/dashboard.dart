// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/utils/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2E41),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoSims(),
            SizedBox(
              height: 60,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff696D80),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(30),
              width: 300,
              height: 250,
              child: SvgPicture.asset('assets/img/dashboard.svg'),
            ),
            SizedBox(
              height: 125,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff867EBA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2F2E41),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xff867EBA),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
