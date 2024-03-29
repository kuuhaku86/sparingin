import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/models/features/auth/register/register_page.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
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
  List<FocusNode> focusNode = [];

  @override
  void initState() {
    super.initState();
    _isRightEmail = true;
    _isRightPassword = true;
    for (var i = 0; i < 2; i++) {
      focusNode.add(new FocusNode());
      focusNode[i].addListener(() {
        setState(() {});
      });
    }
  }

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled() =>
      isPopulated &&
      Validators.isValidEmail(_emailController.text) &&
      Validators.isValidPassword(_passwordController.text);

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
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 125,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    viewportFraction: 1.0,
                    pauseAutoPlayOnTouch: true,
                  ),
                  items: itemCarousel,
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
                buildPadding(35),
                buildTextField(false, _emailController, "Email", 0),
                Padding(
                  padding: EdgeInsets.only(top: 7.0),
                ),
                buildTextField(true, _passwordController, "Password", 1),
                _message(!_isRightEmail || !_isRightPassword,
                    widget: Center(
                      child: Text(
                        "Please insert the right email or password",
                        style: TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    )),
                buildPadding(35),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
                  child: Container(
                    height: 60,
                    color: isLoginButtonEnabled()
                        ? MyColors.primary
                        : MyColors.disabledButton,
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
                  onPressed: isLoginButtonEnabled() ? _goDashboard : null,
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
        bottomNavigationBar: DefaultBottomBar(
          color: MyColors.background,
        ),
      ),
    );
  }

  Container buildTextField(
      bool isObscure,
      TextEditingController textEditingController,
      String hintText,
      int focusNum) {
    return Container(
      width: 275.0,
      height: 60,
      color: MyColors.input,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: TextFormField(
          focusNode: focusNode[focusNum],
          decoration: InputDecoration(
            hintText: focusNode[focusNum].hasFocus ? "" : hintText,
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
    if (_emailController.text == Me.email) {
      if (_passwordController.text == Me.password) {
        Me.saveLogin();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return DashboardPage();
        }));
      } else {
        setState(() {
          _isRightPassword = false;
        });
      }
    } else {
      setState(() {
        _isRightEmail = false;
      });
    }
  }

  void _goRegister() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
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
