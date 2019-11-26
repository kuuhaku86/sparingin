import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';

class TimKamiPage extends StatefulWidget {
  TimKamiPage({Key key}) : super(key: key);

  @override
  _TimKamiPageState createState() => _TimKamiPageState();
}

class _TimKamiPageState extends State<TimKamiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("TIM KAMI", null),
      body: ListView(
        children: <Widget>[
          buildPadding(20),
          Image.asset(
            "assets/images/card/juaraFutsal.jpg",
          ),
          buildPadding(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/card/krustykrab.png",
                height: 80,
              ),
              SizedBox(width: 4,),
              Column(
                children: <Widget>[
                  Text(
                    "Tim Juara",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  buildPadding(3),
                  Text(
                    "Gampanglah Buat Juara",
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}