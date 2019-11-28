import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/team.dart';

class TimKamiPage extends StatefulWidget {
  TimKamiPage({Key key}) : super(key: key);

  @override
  _TimKamiPageState createState() => _TimKamiPageState();
}

class _TimKamiPageState extends State<TimKamiPage> {
  @override
  void initState() {
    super.initState();
    if(listTeam[Me.team].teamPlayer.length != 4){
      listTeam[Me.team].teamPlayer.add(Me.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("TIM KAMI", null),
      body: Me.team != -1 ? ListView(
        children: <Widget>[
          Image.asset(
            listTeam[Me.team].image,
            height: 200,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          buildPadding(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                listTeam[Me.team].icon,
                height: 80,
              ),
              SizedBox(width: 4,),
              Column(
                children: <Widget>[
                  Text(
                    listTeam[Me.team].name,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  buildPadding(3),
                  Text(
                    listTeam[Me.team].slogan,
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  buildPadding(10),
                  Text(
                    "Pemain : ",
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 20,
                    ),
                  ),
                  buildPadding(5),
                ],
              ),
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listTeam[Me.team].teamPlayer.length,
            itemBuilder: (BuildContext context, int index) {
              final item = listTeam[Me.team].teamPlayer[index];
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    item,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 17,
                    ),
                  ),
              );
            },
          ),
        ],
      ) : Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          "Belum ada tim",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: MyColors.font,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}