import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_card.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/team.dart';
import 'package:toast/toast.dart';

class IkutTimLainPage extends StatefulWidget {
  IkutTimLainPage({Key key}) : super(key: key);

  @override
  _IkutTimLainPageState createState() => _IkutTimLainPageState();
}

class _IkutTimLainPageState extends State<IkutTimLainPage> {
  List<Team> tempList = [];

  @override
  void initState() { 
    super.initState();
    for (var i = 0; i < listTeam.length; i++) {
      if(listTeam[i].full == false) {
        tempList.add(listTeam[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Ikut Tim Lain", null),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: tempList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: buildCard(
              tempList[index].image, 
              tempList[index].icon, 
              tempList[index].name, 
              tempList[index].slogan, 
              tempList[index].status),
            onTap: (){
              Toast.show("Berhasil Mengikuti Tim", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              if(Me.team != -1 && listTeam[Me.team].teamPlayer.length == 4)
                listTeam[Me.team].teamPlayer.removeLast();
              for (var i = 0; i < listTeam.length; i++) {
                if(tempList[index].name == listTeam[i].name) {
                  Me.team = i;
                  listTeam[Me.team].teamPlayer.add(Me.name);
                  Navigator.pop(context);
                }
              }
            },
          );
        },
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}