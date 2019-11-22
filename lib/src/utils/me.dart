import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Me {
  static String isLogin = "isLogin";
  static String token = "token";
  static String loginData = "login-data";
  static String name = "user";
  static String password = "user123";
  static String email = "user@gmail.com";
  static String telp = "08123456789";

  static saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, true);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? false;
  }

  static Future<String> getStrData({String key}) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

  static Future<bool> getLogin() async {
    String data = (await SharedPreferences.getInstance()).getString(loginData);
    return data != null ? true : null;
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
