import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/akunSaya/kataSandi/kata_sandi.dart';
import 'package:sparingin/src/models/features/auth/dashboard/akunSaya/riwayat/riwayat.dart';
import 'package:sparingin/src/models/features/auth/dashboard/akunSaya/ubahProfil/ubah_profil.dart';
import 'package:sparingin/src/models/features/auth/login/login_page.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';

class AkunSayaPage extends StatefulWidget {
  AkunSayaPage({Key key}) : super(key: key);

  @override
  _AkunSayaPageState createState() => _AkunSayaPageState();
}

class _AkunSayaPageState extends State<AkunSayaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("AKUN SAYA",null),
      body: ListView(
        children: <Widget>[
          buildPadding(25),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/images/profile.png",
                height: 75,
                ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    Me.username,
                    style: TextStyle(
                      color: MyColors.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    Me.name,
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    child: Text(
                    "Ubah Profil >",
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (_) {
                          return UbahProfilPage();
                        }
            ));
                    },
                  ),
                ],
              )
            ],
          ),
          buildPadding(20),
          buildButton(Me.point.toString() + " Poin",1,true),
          buildPadding(13),
          buildButton("Rewards",2,true),
          buildPadding(13),
          buildButton("Riwayat Pemesanan",3,true),
          buildPadding(13),
          buildButton("Kata Sandi",3,false),
          buildPadding(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              child: Text(
                "Hapus Akun",
                style: TextStyle(
                  color: MyColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Me.logout();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (_) {
                    return LoginPage();
                  }
                ), ModalRoute.withName('/'));
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(color: MyColors.transparent,),
    );
  }

  Widget buildButton(String text,int index, bool isRiwayat) => GestureDetector(
      child: Container(
        width: double.infinity,
        height: 60,
        color: MyColors.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                ">",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
              ),
            )
          ],
        ),
    ),
    onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => isRiwayat ? RiwayatPage(kind: index) : ChangePasswordPage(),
      ));
    },
  );
}