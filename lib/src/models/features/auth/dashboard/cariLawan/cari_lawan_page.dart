import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_card.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/team.dart';
import 'package:toast/toast.dart';

class CariLawanPage extends StatefulWidget {
  CariLawanPage({Key key}) : super(key: key);

  @override
  _CariLawanPageState createState() => _CariLawanPageState();
}

class _CariLawanPageState extends State<CariLawanPage> {
  List<Card> item = [];

  @override
  void initState() {
    super.initState();
    for (var team in listTeam) {
      if(team.full == true)
        item.add(buildCard(
          team.image, 
          team.icon, 
          team.name, 
          team.slogan, 
          team.status));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("CARI LAWAN", null),
      body: ListView(
        children: <Widget>[
          buildPadding(20),
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