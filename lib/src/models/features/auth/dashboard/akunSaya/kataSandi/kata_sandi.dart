import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:toast/toast.dart';

class ChangePasswordPage extends StatefulWidget {
  ChangePasswordPage({Key key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  List <TextEditingController> textEditingController = [
    new TextEditingController(),
    new TextEditingController(),
    new TextEditingController(),
  ];

  bool isFilled() => 
    textEditingController[0].text.isNotEmpty && textEditingController[1].text.isNotEmpty && textEditingController[2].text.isNotEmpty;

  bool isPassword() => textEditingController[0].text == Me.password;

  bool isSame() => textEditingController[1].text == textEditingController[2].text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Ganti Password", null),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildTextField(textEditingController[0], "Password Lama"),
            buildPadding(10),
            buildTextField(textEditingController[1], "Password Baru"),
            buildPadding(10),
            buildTextField(textEditingController[2], "Masukan Lagi Password Baru"),
            buildPadding(20),
            Center(
              child: RaisedButton(
                onPressed: (){
                  if(isFilled() && isPassword() && isSame()) {
                    Me.password = textEditingController[1].text;
                    Toast.show("Berhasil mengubah password", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    Navigator.pop(context);
                  }else{
                    Toast.show("There's Something Wrong", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    return;
                  }
                } ,
                child: Text(
                  "Change Password"
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildTextField(TextEditingController textEditingController, String name) => Container(
    width: 250,
    height: 45,
    child: TextFormField(
      textAlign: TextAlign.center,
      controller: textEditingController,
      obscureText: true,
      style: TextStyle(
        color: MyColors.font,
        fontSize: 17,
      ),
      decoration: InputDecoration(
        hintText: name,
        hintStyle: TextStyle(
          color: MyColors.font,
          fontSize: 17,
        ),
      ),
    ),
  );
}