import 'package:cleon_mobile/bloc/shop/shop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<String> jenisPaket = ["SS", "Time Base", "Kuota", "Unlimited"];
  List listEvent = [
    changeToSs(),
    changeToTimeBase(),
    changeToKuota(),
    changeToUnlimited()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: const Color(0xffdedede),
        ),
      ),
      backgroundColor: const Color(0xffdedede),
      body: BlocProvider<ShopBloc>(
        create: (context) => ShopBloc(),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: jenisPaket.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff867EBA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: () {
                          context.read<ShopBloc>().add(listEvent[index]);
                        },
                        child: Text(jenisPaket[index]),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 10,
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return state.currentWidget;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
