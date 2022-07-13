// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cleon_mobile/models/riwayat.dart';
import 'package:flutter/material.dart';

class DetailRiwayat extends StatelessWidget {
  final Riwayat riwayat;
  const DetailRiwayat({Key? key, required this.riwayat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A2F4A),
        title: const Text("Detail Riwayat Transaksi"),
      ),
      backgroundColor: const Color(0xffdedede),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    riwayat.nama,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(riwayat.keterangan),
                ],
              ),
              Container(
                padding: EdgeInsets.all(6),
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff2A2F4A),
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset('assets/logo/splashscreen.png'),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, -3),
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.71,
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                children: [
                  Text(
                    'Panduan Penggunaan (User Guide)',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '1. Sambungkan koneksi device anda dengan hotspot.\n2.Tunggu hingga anda dialihkan ke halaman login.\n3.Masukkan username dan password yang ada dibawah.\n4.Anda sudah dapat menggunakan internet sesuai paket anda',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Username = " + riwayat.username,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Password = " + riwayat.password,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
