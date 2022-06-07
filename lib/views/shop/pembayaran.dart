// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:cleon_mobile/api/api_services.dart';
import 'package:cleon_mobile/models/paket.dart';
import 'package:cleon_mobile/views/shop/success.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

class Pembayaran extends StatefulWidget {
  final Paket paket;
  const Pembayaran({Key? key, required this.paket}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

enum MetodePembayaran { gopay, indomaret, alfamart }

class _PembayaranState extends State<Pembayaran> {
  final api = ApiServices();
  MetodePembayaran? _metodePembayaran = MetodePembayaran.gopay;
  final currency = NumberFormat("#,###", "pt");

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    initDynamicLink();
  }

  void initDynamicLink() async {
    FirebaseDynamicLinks.instance.onLink.listen((event) {
      var param = int.parse(event.link.queryParameters["id_paket"].toString());
      Navigator.pop(context);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Success(idPaket: param)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F2E41),
        centerTitle: true,
        title: Text('Pembayaran'),
      ),
      backgroundColor: Color(0xffdedede),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text(widget.paket.nama),
                  trailing: Text("Rp. ${currency.format(widget.paket.harga)}"),
                ),
              ),
              ListTile(
                title: Text("Biaya Merchant"),
                trailing: Text("Rp. ${currency.format(1000)}"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text("Total"),
                trailing:
                    Text("Rp. ${currency.format(widget.paket.harga + 1000)}"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 115),
            child: Column(
              children: [
                Text(
                  "Pilih metode pembayaran",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Card(
                  margin:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                          minHeight: 20,
                          minWidth: 20),
                      child: Image.asset('assets/logo/gopay.png'),
                    ),
                    title: Text("Gopay"),
                    trailing: Radio<MetodePembayaran>(
                      activeColor: Color(0xff867EBA),
                      value: MetodePembayaran.gopay,
                      groupValue: _metodePembayaran,
                      onChanged: (MetodePembayaran? value) {
                        setState(() {
                          _metodePembayaran = value;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                          minHeight: 20,
                          minWidth: 20),
                      child: Image.asset('assets/logo/alfamart.png'),
                    ),
                    title: Text("Alfamart"),
                    trailing: Radio<MetodePembayaran>(
                      activeColor: Color(0xff867EBA),
                      value: MetodePembayaran.alfamart,
                      groupValue: _metodePembayaran,
                      onChanged: (MetodePembayaran? value) {
                        setState(() {
                          _metodePembayaran = value;
                        });
                      },
                    ),
                  ),
                ),
                Card(
                  margin:
                      EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: 40,
                          maxWidth: 40,
                          minHeight: 20,
                          minWidth: 20),
                      child: Image.asset('assets/logo/indomaret.png'),
                    ),
                    title: Text("Indomaret"),
                    trailing: Radio<MetodePembayaran>(
                      activeColor: Color(0xff867EBA),
                      value: MetodePembayaran.indomaret,
                      groupValue: _metodePembayaran,
                      onChanged: (MetodePembayaran? value) {
                        setState(() {
                          _metodePembayaran = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>
          //                   Success(idPaket: widget.paket.id)));
          //     },
          //     child: Text("Success Page")),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Align(
              child: SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff867EBA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Bayar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // print(_metodePembayaran.toString().split('.').last);
                    EasyLoading.show(status: 'loading').then((_) async {
                      String result = await api.pembayaran(
                          _metodePembayaran.toString().split('.').last,
                          widget.paket.harga + 1000,
                          widget.paket.id);
                      print(result);
                      EasyLoading.dismiss();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
