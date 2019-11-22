import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparingin/src/models/auth/login.dart';

class Me {
  static String isLogin = "isLogin";
  static String token = "token";
  static String name = "name";
  static String loginData = "login-data";

  static saveLogin(Login login) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, true);
    prefs.setString(loginData, jsonEncode(login));
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? false;
  }

  static Future<String> getStrData({String key}) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

  static Future<Login> getLogin() async {
    String data = (await SharedPreferences.getInstance()).getString(loginData);
    return data != null ? Login.fromJson(jsonDecode(data)) : null;
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
