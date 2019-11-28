import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/team.dart';
import 'package:toast/toast.dart';

class BuatTimPage extends StatefulWidget {
  BuatTimPage({Key key}) : super(key: key);

  @override
  _BuatTimPageState createState() => _BuatTimPageState();
}

class _BuatTimPageState extends State<BuatTimPage> {
  List <TextEditingController> textEditingController = [];
  @override
  void initState() {
    super.initState();
    textEditingController.add(new TextEditingController(text: Me.name));
    for (var i = 0; i < 5; i++) {
      textEditingController.add(new TextEditingController());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Buat Tim Baru", null),
      body: ListView(
        children: <Widget>[
          buildPadding(10),
          Center(
            child: Text(
              "Masukkan Nama Tim Anda",
              style: TextStyle(
                color: MyColors.font,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildPadding(10),
          buildTextField(textEditingController[5], false),
          buildPadding(10),
          Center(
            child: Text(
              "Masukkan Nama Pemain-Pemain Anda",
              style: TextStyle(
                color: MyColors.font,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildPadding(10),
          buildTextField(textEditingController[0], false),
          buildPadding(10),
          buildTextField(textEditingController[1], false),
          buildPadding(10),
          buildTextField(textEditingController[2], false),
          buildPadding(10),
          buildTextField(textEditingController[3], false),
          buildPadding(10),
          buildTextField(textEditingController[4], false),
          buildPadding(10),
          Center(
            child: RaisedButton(
              child: Text(
                "Buat Tim",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              onPressed: (){
                if(textEditingController[5].text.isEmpty)return;
                List<String> player = [];
                for (var i = 0; i < 5; i++) {
                  if(textEditingController[i].text.isNotEmpty)
                    player.add(textEditingController[i].text);
                }
                var tempTeam = new Team(
                  "assets/images/card/its.png", 
                  "assets/images/card/its.png",
                  textEditingController[5].text, 
                  "Bersatu Kita Jaya", 
                  "Siap bertanding", 
                  true, 
                  player);
                listTeam.add(tempTeam);
                Me.team = listTeam.length - 1;
                Toast.show("Berhasil Membuat Tim", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildTextField(TextEditingController textEditingController, bool isNumber) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: MyColors.background,
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    height: 50,
    child: TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: TextStyle(
        color: MyColors.font,
      ),
      controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  );
}