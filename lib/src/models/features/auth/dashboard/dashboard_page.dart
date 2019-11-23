import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text("HALAMAN UTAMA"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: MyColors.background,
        child: SingleChildScrollView(

        ),
      ),
      bottomNavigationBar: Stack(
        children: <Widget>[
          DefaultBottomBar(),
        ],
      ),
    );
  }
}