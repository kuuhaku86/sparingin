import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_card.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:toast/toast.dart';

class CariLawanPage extends StatefulWidget {
  CariLawanPage({Key key}) : super(key: key);

  @override
  _CariLawanPageState createState() => _CariLawanPageState();
}

class _CariLawanPageState extends State<CariLawanPage> {
  List<Card> item = [
    buildCard(
      'assets/images/card/chelseaFutsal.jpg', 
      'assets/images/card/chelsea.png', 
      "Chelsea FC", 
      "KTBBF", 
      "Sedang mencari lawan"),
      buildCard(
      'assets/images/card/liverpoolFutsal.jpg', 
      'assets/images/card/liverpool.png', 
      "Liverpool FC", 
      "You'll Never Walk Alone", 
      "Sedang bertanding"),
      buildCard(
      'assets/images/card/totenhamFutsal.jpg', 
      'assets/images/card/totenham.png', 
      "Chelsea FC", 
      "KTBBF", 
      "Sedang mencari lawan"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("CARI LAWAN", null),
      body: ListView(
        children: <Widget>[
          buildPadding(10),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: 175,
              height: 40,
              decoration: BoxDecoration(
                color: MyColors.input,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Cari Berdasarkan",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          CarouselSlider(
            enlargeCenterPage: true,
            height: 298,
            items: item,
            pauseAutoPlayOnTouch: Duration(seconds: 5),
          ),
          buildPadding(10),
          buildButton("IKUTI PERTANDINGAN","Mengikuti Pertandingan"),
          buildPadding(10),
          buildButton("AJAK BERTANDING","Berhasil mengajak bertanding"),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildButton(String text,String pesan) => GestureDetector(
    child: Container(
      width: double.infinity,
      height: 70,
      color: MyColors.primary,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    onTap: () async {
      Toast.show(pesan, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (_) {
          return DashboardPage();
        }
      ), ModalRoute.withName('/'));
    });
}