import 'package:flutter/material.dart';

class Menu {
  String name;
  String image;
  dynamic page;

  Menu({
    @required this.name, 
    @required this.image, 
    this.page})
  : assert(name != null),
  assert(image != null);
}