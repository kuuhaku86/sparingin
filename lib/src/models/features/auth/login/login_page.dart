import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/models/features/auth/register/register_page.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/validators.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Widget> itemCarousel = [
    new Image.asset(
      "assets/images/turnamen1.jpg",
      height: 100.0,
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    new Image.asset(
      "assets/images/turnamen2.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    )
  ];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRightEmail;
  bool _isRightPassword; 

  @override
  void initState() { 
    super.initState();
    _isRightEmail = true;
    _isRightPassword = true;
  }

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled() =>
    isPopulated && Validators.isValidEmail(_emailController.text) && Validators.isValidPassword(_passwordController.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.primary,
        ),
        body: Container(
          height: double.infinity,
          color: MyColors.background,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  enlargeCenterPage: true,
                  height: 125,
                  items: itemCarousel,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1.0,
                  pauseAutoPlayOnTouch: Duration(seconds: 5),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                ),
                Image.asset(
                  "assets/images/lapangan.jpg",
                  height: 75.0,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                buildPadding(),
                buildTextField(false,_emailController,"Email"),
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.0
                  ),
                ),
                buildTextField(true,_passwordController,"Password"),
                _message(!_isRightEmail || !_isRightPassword,
                  widget: Center(
                    child: Text(
                      "Please insert the right email or password",
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                )),
                buildPadding(),
                RaisedButton(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 60,
                    color: MyColors.primary,
                    child: Center(
                      child: Text(
                        "MASUK",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  onPressed: isLoginButtonEnabled() ? 
                    _goDashboard : 
                    null,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tidak punya akun ? ",
                          style: TextStyle(
                            color: MyColors.font,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "DAFTAR",
                            style: TextStyle(
                              color: MyColors.font,
                              decoration: TextDecoration.underline,
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          onTap: _goRegister,
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
        bottomNavigationBar: Stack(
          children: <Widget>[
            DefaultBottomBar(),
          ],
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.only(
        top: 35.0
      ),
    );
  }

  Container buildTextField(bool isObscure, TextEditingController textEditingController, String hintText) {
    return Container(
      width: 275.0,
      height: 60,
      color: MyColors.input,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
          obscureText: isObscure,
          controller: textEditingController,
        ),
      ),
    );
  }

  void _goDashboard() {
    if(_emailController.text == Me.email){
      if(_passwordController.text == Me.password){
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (_) {
            return DashboardPage();
          }));
      }else{
        setState(() {
          _isRightPassword = false;
        });
      }
    }else{
      setState(() {
        _isRightEmail = false;
      });
    }
  }

  void _goRegister() {
    Navigator.push(context, MaterialPageRoute(
      builder: (_) {
        return RegisterPage();
      }));
  }

  Widget _message(bool isShow, {Widget widget}) {
    return Visibility(
      visible: isShow,
      child: Container(
        height: 17,
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}