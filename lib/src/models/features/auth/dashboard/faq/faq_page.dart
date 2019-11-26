import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:toast/toast.dart';

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
      body: ListView(
        children: <Widget>[
          buildPadding(90),
          Center(
            child: Text(
              "Kritik & Saran",
              style: TextStyle(
                color: MyColors.font,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          buildPadding(10),
          Center(
            child: Container(
              color: MyColors.background,
              width: 250,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          buildPadding(10),
          Center(
            child: RaisedButton(
              color: MyColors.font,
              onPressed: (){
                Toast.show("Berhasil Mengirim", context);
                Navigator.pop(context);
              },
              child: Text(
                "Kirim",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}