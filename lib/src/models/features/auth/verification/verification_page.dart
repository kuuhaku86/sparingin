import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';
import 'package:sparingin/src/models/features/auth/dashboard/dashboard_page.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/me.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool full = false;

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
                      full = true;
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
                            onTap: null,
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

  void _goDashboard() {
    Me.saveLogin();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) {
        return DashboardPage();
      }));
  }
}