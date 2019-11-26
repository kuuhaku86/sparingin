import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';

class CariLapanganPage extends StatefulWidget {
  CariLapanganPage({Key key}) : super(key: key);

  @override
  _CariLapanganPageState createState() => _CariLapanganPageState();
}

class _CariLapanganPageState extends State<CariLapanganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("CARI LAPANGAN", null),
      body: ListView(
        
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}