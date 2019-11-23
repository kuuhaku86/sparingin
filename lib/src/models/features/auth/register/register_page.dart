import 'package:flutter/material.dart';
import 'package:sparingin/src/models/features/auth/login/login_page.dart';
import 'package:sparingin/src/models/features/auth/verification/verification_page.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/validators.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  List<FocusNode> focusNode = [];

  @override
  void initState() { 
    super.initState();

    for (var i = 0; i < 4; i++) {
      focusNode.add(new FocusNode());
    }

    for (var focNode in focusNode) {
      focNode.addListener(() {
        setState(() {});
      });
    }
  }

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty && _nameController.text.isNotEmpty && _telpController.text.isNotEmpty;
  
  bool isLoginButtonEnabled() =>
    isPopulated && Validators.isValidEmail(_emailController.text) && Validators.isValidPassword(_passwordController.text) && Validators.isValidTelp(_telpController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text(
          "Daftar"
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        color: MyColors.background,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                buildPadding(70),
                buildTextField(false, _nameController, "NAMA PENGGUNA",false,0),
                buildPadding(15),
                buildTextField(false, _emailController, "EMAIL",false,1),
                buildPadding(15),
                buildTextField(true, _passwordController, "KATA SANDI",false,2),
                buildPadding(15),
                buildTextField(false, _telpController, "NOMOR TELEPON",true,3),
                buildPadding(40),
                RaisedButton(
                  color: Colors.grey,
                  disabledColor: MyColors.disabledButton,
                  onPressed: isLoginButtonEnabled() ? _goVerification : null,
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                buildPadding(30),
                GestureDetector(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: MyColors.font,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    ),
                  ),
                  onTap: _goLogin,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
          children: <Widget>[
            DefaultBottomBar(),
          ],
        ),
    );
  }

  Padding buildPadding(double nums) {
    return Padding(
      padding: EdgeInsets.only(top: nums),
    );
  }

  Container buildTextField(bool isObscure, TextEditingController textEditingController, String hintText, bool onlyNumber, int focusNodeNum) {
    return Container(
      width: double.infinity,
      height: 60,
      color: MyColors.primary,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 10),
        child: TextFormField(
          focusNode: focusNode[focusNodeNum],
          textAlign: TextAlign.center,
          keyboardType: onlyNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: focusNode[focusNodeNum].hasFocus ? "" : hintText,
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

  void _goVerification() {
    Me.changeData(
      _nameController.text,
      _telpController.text, 
      _passwordController.text, 
      _emailController.text,
    );
    Me.saveLogin();
    print(Me.name);
    print(Me.telp);
    print(Me.password);
    print(Me.email);
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) {
        return VerificationPage();
      }));
  }

  void _goLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) {
        return LoginPage();
      }));
  }
}