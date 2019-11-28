import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sparingin/src/models/features/auth/dashboard/akunSaya/riwayat/riwayat.dart';
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
  final TextEditingController _emailController = TextEditingController(text: Me.email);
  final TextEditingController _telpController = TextEditingController(text: Me.telp);
  final TextEditingController _usernameController = TextEditingController(text: Me.username);
  final format = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    Me.tempTanggalLahir = Me.tanggalLahir;
    super.initState();
  }

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
                    if(Me.tempTanggalLahir != null) Me.tanggalLahir = Me.tempTanggalLahir;
                    Me.username = _usernameController.text;
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
                height: 100,
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
              children: <Widget>[
                buildPadding(50),
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
                      Me.point.toString() + " Points | ",
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
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_) => RiwayatPage(kind: 2),
                        ));
                      },
                    ),
                  ],
                ),
                buildPadding(20),
                buildTextField( _nameController,false),
                buildPadding(10),
                buildTextField( _usernameController,false),
                buildPadding(10),
                buildTextField( _telpController,true),
                buildPadding(10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: MyColors.background,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 50,
                  child: DateTimeField(
                    resetIcon: null,
                    textAlign: TextAlign.left,
                    format: format,
                    style: TextStyle(
                      color: MyColors.font,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      hintText: format.format(Me.tanggalLahir),
                      hintStyle: TextStyle(
                        color: MyColors.font,
                      ),
                      border: InputBorder.none,
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1990,1,1),
                          initialDate: currentValue ?? Me.tanggalLahir,
                          lastDate: DateTime(2014,12,30));
                    },
                    onChanged: (DateTime newValue) {
                      setState(() {
                      Me.tempTanggalLahir = newValue;
                      });
                    },
                    readOnly: true,
                  ),
                ),
                buildPadding(10),
                buildTextField( _emailController,false),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: DefaultBottomBar(),
    );
  }

  Widget buildTextField(TextEditingController textEditingController, bool isNumber) => Container(
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
    _emailController.text.isNotEmpty && _nameController.text.isNotEmpty && _telpController.text.isNotEmpty && Me.tempTanggalLahir != null;
  
  bool isLoginButtonEnabled() =>
    isPopulated && Validators.isValidEmail(_emailController.text) && Validators.isValidTelp(_telpController.text);
}