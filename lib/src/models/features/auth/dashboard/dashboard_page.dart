import 'package:flutter/material.dart';
import 'package:sparingin/src/models/auth/login.dart';

class DashboardPage extends StatefulWidget {
  Login login;
  DashboardPage({Key key, this.login}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(),
    );
  }
}