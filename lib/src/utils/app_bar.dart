import 'package:flutter/material.dart';
import 'package:sparingin/src/utils/colors.dart';

AppBar buildAppBar(String text, dynamic icon) => AppBar(
      leading: icon,
      title: Text(
      text,
      ),
      backgroundColor: MyColors.primary,
      centerTitle: true,
      actions: <Widget>[
            Icon(
              Icons.refresh,
              size: 35,
            ),
            SizedBox(width: 10,)
      ],
    );