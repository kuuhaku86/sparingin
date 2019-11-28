import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:sms/sms.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool full = false;
  SmsSender sender = new SmsSender();
  String address = "+62" + Me.tempTelp.substring(1);
  var rng = new Random();
  int verifCode = 1000;
  String userVerif;

  @override
  void initState() {
    super.initState();
    verifCode = rng.nextInt(8000) + 1000;
    sender.sendSms(new SmsMessage(address, 'Insert this verification code : ' + verifCode.toString()));
  }

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
        width: double.infinity,
        color: MyColors.background,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                buildPadding(100.0),
                Container(
                  color: MyColors.primary,
                  height: 60.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "MASUKAN KODE VERIFIKASI",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                buildPadding(50),
                VerificationCodeInput(
                  keyboardType: TextInputType.number,
                  length: 4,
                  onCompleted: (String value) {
                    setState(() {
                      userVerif = value;
                      full = true;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      full = false;
                    });
                  },
                ),
                buildPadding(20),
                Container(
                  width: 320,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Kode dikirimkan melalui nomor telepon Anda\nCek pesan masuk dari CS kami",
                        style: TextStyle(
                          color: MyColors.font,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Tidak menerima kode? ",
                            style: TextStyle(
                              color: MyColors.font,
                              fontSize: 16,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Kirim ulang kode",
                              style: TextStyle(
                                color: MyColors.font,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              verifCode = rng.nextInt(8000) + 1000;
                              sender.sendSms(new SmsMessage(address, 'Insert this verification code : ' + verifCode.toString()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buildPadding(80),
                RaisedButton(
                  color: Colors.grey,
                  disabledColor: MyColors.disabledButton,
                  onPressed: full ? _goDashboard : null,
                  child: Text(
                    "Lanjutkan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(color: MyColors.background,),
    );
  }

  void _goDashboard() {
    Me.saveLogin();
    Me.register = true;
    Me.changeData(
      Me.tempName,
      Me.tempTelp, 
      Me.tempPassword, 
      Me.tempEmail,
      Me.register
    );
    if(Me.tempTanggalLahir != null && verifCode.toString() == userVerif ) {
      Me.tanggalLahir = Me.tempTanggalLahir;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (_) {
          return DashboardPage();
        }
      ), ModalRoute.withName('/'));
    }
  }

  
}