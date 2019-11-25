import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';

class PengaturanPage extends StatefulWidget {
  PengaturanPage({Key key}) : super(key: key);

  @override
  _PengaturanPageState createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("PENGATURAN", null),
      body: Center(
        child: ListView(
          children: <Widget>[
            buildPadding(30),
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/profile.png',
                  height: 50,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      Me.name,
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
          ],
        ),
      ),
    );
  }
}