import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:sparingin/src/utils/validators.dart';

class UbahProfilPage extends StatefulWidget {
  UbahProfilPage({Key key}) : super(key: key);

  @override
  _UbahProfilPageState createState() => _UbahProfilPageState();
}

class _UbahProfilPageState extends State<UbahProfilPage> {
  final TextEditingController _nameController = TextEditingController(text: Me.name);
  final TextEditingController _tanggalController = TextEditingController(text: Me.tanggalLahir);
  final TextEditingController _emailController = TextEditingController(text: Me.email);
  final TextEditingController _telpController = TextEditingController(text: Me.telp);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        actions: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 8.0),
                child: GestureDetector(
                  child: Text(
                    "SIMPAN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: isLoginButtonEnabled() ? (){
                    Me.name = _nameController.text;
                    Me.telp = _telpController.text;
                    Me.email = _emailController.text;
                    Me.tanggalLahir = _tanggalController.text;
                    Navigator.pop(context);
                  } : null,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 130,
                color: Color.fromRGBO(175, 239, 175, 1),
              ),
              Container(
                width: double.infinity,
                height: 380,
              ),
            ],
          ),
          Center(
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildPadding(75),
                Image.asset(
                  "assets/images/profile.png",
                  height: 110,
                ),
                Center(
                  child: Text(
                    Me.name,
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "69 Points | ",
                      style: TextStyle(
                        color: MyColors.font,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        "Rewards Member >",
                        style: TextStyle(
                          color: MyColors.font,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                buildPadding(20),
                buildTextField(Me.name, _nameController,false),
                buildPadding(10),
                buildTextField(Me.telp, _telpController,true),
                buildPadding(10),
                buildTextField(Me.tanggalLahir, _tanggalController,false),
                buildPadding(10),
                buildTextField(Me.email, _emailController,false),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildTextField(String text, TextEditingController textEditingController, bool isNumber) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: MyColors.background,
    ),
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    height: 50,
    child: TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: TextStyle(
        color: MyColors.font,
      ),
      controller: textEditingController,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  );

  bool get isPopulated =>
    _emailController.text.isNotEmpty && _nameController.text.isNotEmpty && _telpController.text.isNotEmpty && _tanggalController.text.isNotEmpty;
  
  bool isLoginButtonEnabled() =>
    isPopulated && Validators.isValidEmail(_emailController.text) && Validators.isValidTelp(_telpController.text);
}