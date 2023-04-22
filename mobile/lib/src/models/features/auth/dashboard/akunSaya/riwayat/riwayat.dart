import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/list_pemesanan.dart';
import 'package:sparingin/src/utils/list_point.dart';
import 'package:sparingin/src/utils/list_reward.dart';
import 'package:sparingin/src/utils/me.dart';

class RiwayatPage extends StatefulWidget {
  final int kind;
  RiwayatPage({Key key, this.kind}) : super(key: key);

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final format = DateFormat("dd-MM-yyyy");
  String title;
  List <ListTile>listItem = [];

@override
  void initState() {
    super.initState();
    switch (widget.kind) {
      case 1:
        title = "Point";
        if(!Me.register){
          for (var item in listPoint) {
            listItem.add(
              new ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: MyColors.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item.point.toString(),
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
              )
            );
          }
        }
        break;
      case 2:
        title = "Rewards";
        if(!Me.register){
          for (var item in listReward) {
            listItem.add(
              new ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: MyColors.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  item.benefit,
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
              )
            );
          }
        }
        break;
      case 3:
        title = "Riwayat Pemesanan";
        if(Me.register){
          for (var item in listPemesanan2) {
            listItem.add(
              new ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    color: MyColors.font,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  format.format(item.time),
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
                trailing: Text(
                  item.total.toString(),
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
              )
            );
          }
        }else{
          for (var item in listPemesanan1) {
            listItem.add(
              new ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: MyColors.font,
                  ),
                ),
                subtitle: Text(
                  format.format(item.time),
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
                trailing: Text(
                  item.total.toString(),
                  style: TextStyle(
                    color: MyColors.font,
                  ),
                ),
              )
            );
          }
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title, null),
      body: listItem.length > 0 ? ListView.builder(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return listItem[index];
        },
      ) : Center(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Tidak Ada Riwayat",
            style: TextStyle(
              color: MyColors.font,
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}