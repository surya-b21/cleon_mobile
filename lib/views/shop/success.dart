// ignore_for_file: prefer_const_constructors

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/transaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class Success extends StatefulWidget {
  final int idPaket;
  const Success({Key? key, required this.idPaket}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final api = ApiServices();
  late Future<Transaksi> createRiwayat;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    createRiwayat = api.requestPaket(widget.idPaket);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pembayaran Sukses'),
        backgroundColor: const Color(0xff2A2F4A),
      ),
      backgroundColor: const Color(0xffdedede),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: SvgPicture.asset('assets/img/payment-success.svg'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.25,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Username dan Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FutureBuilder<Transaksi>(
                      future: createRiwayat,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "Username = " + snapshot.data!.username,
                            style: TextStyle(fontSize: 14),
                          );
                        } else {
                          return Shimmer(
                            gradient: LinearGradient(stops: const [
                              0.4,
                              0.5,
                              0.6
                            ], colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.white.withOpacity(0.5),
                              Colors.black.withOpacity(0.25)
                            ]),
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  FutureBuilder<Transaksi>(
                      future: createRiwayat,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            "Password = " + snapshot.data!.password,
                            style: TextStyle(fontSize: 14),
                          );
                        } else {
                          return Shimmer(
                            gradient: LinearGradient(stops: const [
                              0.4,
                              0.5,
                              0.6
                            ], colors: [
                              Colors.black.withOpacity(0.25),
                              Colors.white.withOpacity(0.5),
                              Colors.black.withOpacity(0.25)
                            ]),
                            child: Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.black.withOpacity(0.25)),
                            ),
                          );
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Username dan password dapat dilihat kembali pada detail transaksi di menu home",
                      textAlign: TextAlign.center,
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
