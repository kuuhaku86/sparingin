import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';
import 'package:toast/toast.dart';

class PayPage extends StatefulWidget {
  final String title;
  final bool add;

  PayPage({Key key,this.title,this.add}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(widget.title, null),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              height: 45,
              color: MyColors.input,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 17,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Insert The Number Here",
                  hintStyle: TextStyle(
                    color: MyColors.font,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            buildPadding(20),
            Center(
              child: RaisedButton(
                child: Text(
                  widget.title
                ),
                onPressed: (){
                  if(!widget.add) {
                    if(int.parse(textEditingController.text) > Me.money ) {
                      Toast.show("Saldo Kurang", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      return;
                    }else{
                      Me.money -= int.parse(textEditingController.text);
                      Toast.show("Berhasil membayar", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                      Navigator.pop(context);
                    }
                  } else {
                    Me.money += int.parse(textEditingController.text);
                    Toast.show("Berhasil menambah saldo", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }
}