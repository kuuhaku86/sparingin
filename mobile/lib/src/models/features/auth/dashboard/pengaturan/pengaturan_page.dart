import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/pengaturan/buatTimBaru/buat_tim_page.dart';
import 'package:sparingin/src/models/features/auth/dashboard/pengaturan/ikutTimLain/ikut_tim_lain_page.dart';
import 'package:sparingin/src/models/features/auth/login/login_page.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';

class PengaturanPage extends StatefulWidget {
  PengaturanPage({Key key}) : super(key: key);

  @override
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  List _isSwitched = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("PENGATURAN", null),
      body: ListView(
        children: <Widget>[
          buildPadding(50),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Image.asset(
                  'assets/images/profile.png',
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Me.username,
                      style: TextStyle(
                        color: MyColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      Me.name,
                      style: TextStyle(
                        fontSize: 17,
                        color: MyColors.font,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          buildPadding(50),
          buildButton("BUAT TIM BARU", BuatTimPage()),
          buildPadding(13),
          buildButton("IKUT TIM LAIN", IkutTimLainPage()),
          buildPadding(20),
          buildToggleButton("Notifikasi Pesan", 0),
          buildToggleButton("Notifikasi Tim", 1),
          buildToggleButton("Notifikasi Pertandingan", 2),
          buildPadding(15),
          Center(
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                  onPressed: () {
                    Me.logout();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (_) {
                      return LoginPage();
                    }), ModalRoute.withName('/'));
                  },
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildButton(String text, Widget page) => GestureDetector(
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => page,
              ));
        },
      );

  Widget buildToggleButton(String text, int index) => Center(
        child: Container(
          width: 250,
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 15,
                ),
              ),
              Switch(
                activeColor: MyColors.primary,
                onChanged: (val) => setState(() => _isSwitched[index] = val),
                value: _isSwitched[index],
              ),
            ],
          ),
        ),
      );
}
