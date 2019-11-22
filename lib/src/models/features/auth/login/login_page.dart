import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/validators.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled() =>
    isPopulated && Validators.isValidEmail(_emailController.text) && Validators.isValidPassword(_passwordController.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            
          ),
        ),
      ),
    );
  }
}