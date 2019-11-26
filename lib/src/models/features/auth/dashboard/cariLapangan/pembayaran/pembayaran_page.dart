import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:sparingin/src/utils/app_bar.dart';
import 'package:sparingin/src/utils/bottom_bar.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';
import 'package:sparingin/src/utils/list_lapangan.dart';
import 'package:sparingin/src/utils/me.dart';

class PembayaranPage extends StatefulWidget {
  PembayaranPage({Key key}) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: buildAppBar("PEMBAYARAN", null),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10, right: 10),
              child: Text(
                "Booking",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    lapangan[Me.lapangan].name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  buildPadding(3),
                  SmoothStarRating(
                    rating: lapangan[Me.lapangan].rating,
                    color: Colors.orange,
                    borderColor: Colors.orange,
                  ),
                  Text(
                    lapangan[Me.lapangan].alamat,
                    style: TextStyle(
                      color: MyColors.font,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  buildPadding(3),
                  Row(
                    children: <Widget>[
                      Text(
                        lapangan[Me.lapangan].provinsi + "  ",
                        style: TextStyle(
                          color: MyColors.font,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Buka",
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 10,
              color: MyColors.background,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10, right: 10),
              child: Text(
                "Order Summary",
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 20
                ),
              ),
            ),
            buildPadding(10),
            buildText(true, "1xjam", lapangan[Me.lapangan].name, "150.000"),
            buildText(true, "Potongan", "Promo diskon 10%", "15.000"),
            buildPadding(30),
            buildText(false, "Subtotal", "", "135.000"),
            buildPadding(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: MyColors.font,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "OVO",
                        style: TextStyle(
                          color: MyColors.font,
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "135.000",
                        style: TextStyle(
                          color: MyColors.font,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ],
              ),
            ),
            buildPadding(60),
            Center(
              child: RaisedButton(
                color: MyColors.primary,
                onPressed: () {
                },
                child: Text(
                  "Konfirmasi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: DefaultBottomBar(),
      ),
    );
  }

  Widget buildText(bool isBold, String left, String middle, String right) => Padding(
    padding: EdgeInsets.symmetric(horizontal : 15),
    child: Row(
      children: <Widget>[
        Container(
          width: 80,
          child: Text(
            left,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
              color: MyColors.font,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          width: 180,
          child: Text(
            middle,
            style: TextStyle(
              color: MyColors.font,
              fontSize: 15,
            ),
          ),
        ),
        Container(
          width: 60,
          alignment: Alignment.bottomRight,
          child: Text(
            right,
            style: TextStyle(
              color: MyColors.font,
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
  );
}