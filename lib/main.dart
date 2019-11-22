import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/models/features/auth/login/login_page.dart';
import 'package:sparingin/src/utils/me.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sparingin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body:MainApp()
      ),
    );
  }
}

class MainApp extends StatefulWidget {
  MainApp({Key key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  bool _isVisible = true;
  
  @override
  void initState() {
    super.initState();
    _go();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 3),
          opacity: _isVisible ? 1 : 0,
        ),
      ),
    );
  }

  _go() => Timer(Duration(seconds: 3), () async {
    final login = await Me.getLogin();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) {
        return login != null ? DashboardPage() : LoginPage();
      }
    ));
  });
}