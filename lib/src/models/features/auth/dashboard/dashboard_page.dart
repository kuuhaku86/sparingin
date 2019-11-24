import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/menu.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List <Menu> menu = [
    new Menu(
      name: "Akun Saya",
      image: "assets/images/icons/akunSaya.png"
    ),
    new Menu(
      name: "Pengaturan",
      image: "assets/images/icons/pengaturan.png"
    ),
    new Menu(
      name: "Cari Lawan",
      image: "assets/images/icons/cariLawan.png"
    ),
    new Menu(
      name: "Cari Lapangan",
      image: "assets/images/icons/cariLapangan.png"
    ),
    new Menu(
      name: "Tim Kami",
      image: "assets/images/icons/timKami.png"
    ),
    new Menu(
      name: "FAQ",
      image: "assets/images/icons/faq.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/icon.png",
            height: 20,
          ),
        ),
        backgroundColor: MyColors.primary,
        title: Text("HALAMAN UTAMA"),
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.refresh,
            size: 35,
          ),
          SizedBox(width: 10,)
        ],
    ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildPadding(20),
              _buildPayMenu(),
              buildPadding(10),
              _buildMenu(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DefaultBottomBar(color: MyColors.transparent,),
    );
  }

  Widget _buildPayMenu() => Container(
    height: 110,
    width: 330,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: MyColors.background,
    ),
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "OVO BALANCE",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Rp 300.000",
                style: TextStyle(
                  color: MyColors.font, 
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildRaisedButton("Pay"),
              buildRaisedButton("Top Up"),
              buildRaisedButton("Rewards"),
            ],
          ),
        ),
      ],
    ),
  );

  RaisedButton buildRaisedButton(String text) {
    return RaisedButton(
      color: MyColors.primary,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ), onPressed: () {},
    );
  }

  Padding buildPadding(double nums) {
    return Padding(
        padding: EdgeInsets.only(top: nums),
      );
  }

  Widget _buildMenu() => SizedBox(
    width: double.infinity,
    height: 360,
    child: Container(
      child: GridView.builder(
        physics: ClampingScrollPhysics(),
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, position) {
          return _rowService(menu[position]);
        },
      ),
    ),
  );

  Widget _rowService(Menu menu) => Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.all(13.0),
            child: Image.asset(
              menu.image,
              height: 50,
            ),
          ),
        ),
        buildPadding(6),
        Text(
          menu.name,
          style: TextStyle(
            color: MyColors.font,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}