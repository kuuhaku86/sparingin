import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/colors.dart';
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
                  height: 110,
                  items: itemCarousel,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  viewportFraction: 1.0,
                  pauseAutoPlayOnTouch: Duration(seconds: 5),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                ),
                Image.asset(
                  "assets/images/lapangan.jpg",
                  height: 75.0,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20.0
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}