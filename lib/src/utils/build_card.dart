import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:sparingin/src/utils/build_padding.dart';
import 'package:sparingin/src/utils/colors.dart';

Widget buildCard(String image, String icon, String name, String slogan, String status) => Card(
  child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        image,
        width: double.infinity,
        height: 143,
        fit: BoxFit.cover,
      ),
      buildPadding(3),
      Text(
        "Klik foto untuk mengetahui informasi tim",
        style: TextStyle(
          fontSize: 10,
          color: MyColors.font,
        ),
      ),
      buildPadding(20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            icon,
            height: 60,
          ),
          SizedBox(width: 4,),
          Column(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              buildPadding(3),
              Text(
                slogan,
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              buildPadding(5),
              Text(
                "Status: " + status,
                style: TextStyle(
                  color: MyColors.font,
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  ),
);

Widget buildCardLapangan(String image, String name, String alamat, String provinsi, double rating) => Card(
  child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Image.asset(
        image,
        width: double.infinity,
        height: 175,
        fit: BoxFit.cover,
      ),
      buildPadding(20),
      Column(
        children: <Widget>[
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          buildPadding(3),
          SmoothStarRating(
            rating: rating,
            color: Colors.orange,
            borderColor: Colors.orange,
          ),
          buildPadding(3),
          Text(
            alamat,
            style: TextStyle(
              color: MyColors.font,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          buildPadding(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                provinsi + "  ",
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
      )
    ],
  ),
);