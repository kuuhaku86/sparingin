import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/cariLapangan/pembayaran/pembayaran_page.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_card.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/list_lapangan.dart';
import 'package:sparingin/src/utils/me.dart';

class CariLapanganPage extends StatefulWidget {
  CariLapanganPage({Key key}) : super(key: key);

  @override
  _CariLapanganPageState createState() => _CariLapanganPageState();
}

class _CariLapanganPageState extends State<CariLapanganPage> {
  int indexLapangan = 0;
  List<Card> item = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 3; i++) {
      item.add(buildCardLapangan(lapangan[i].image, lapangan[i].name,
          lapangan[i].alamat, lapangan[i].provinsi, lapangan[i].rating));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("CARI LAPANGAN", null),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              height: 352,
              onPageChanged: (index, _) {
                setState(() {
                  indexLapangan = index;
                });
              },
            ),
            items: item,
          ),
          Center(
            child: Text("Pilih Waktu Bermain",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ),
          buildPadding(7),
          Center(
            child: Text("Mulai : Minggu, 15/09/2019-08.00 WIB",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 15,
                )),
          ),
          Center(
            child: Text("Berakhir : Minggu, 15/09/2019-09.00 WIB",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 15,
                )),
          ),
          buildPadding(15),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(MyColors.primary)),
              onPressed: () {
                Me.lapangan = indexLapangan;
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return PembayaranPage();
                }));
              },
              child: Text("Pesan Lapangan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}
