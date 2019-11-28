import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';

class BuatTimPage extends StatefulWidget {
  BuatTimPage({Key key}) : super(key: key);

  @override
  _BuatTimPageState createState() => _BuatTimPageState();
}

class _BuatTimPageState extends State<BuatTimPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Buat Tim Baru", null),
      body: ListView(),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}