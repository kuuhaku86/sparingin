import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';

class FaqPage extends StatefulWidget {
  FaqPage({Key key}) : super(key: key);

  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("FAQ", null),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "E-mail : cp@gmail.com",
              style: TextStyle(
                fontSize: 25,
                color: MyColors.font,
              ),
            ),
          ),
          buildPadding(30),
          Center(
            child: Text(
              "Phone : 081234567890",
              style: TextStyle(
                fontSize: 25,
                color: MyColors.font,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}