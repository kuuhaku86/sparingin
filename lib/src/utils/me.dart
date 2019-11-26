import 'package:shared_preferences/shared_preferences.dart';

class Me {
  static String isLogin = "isLogin";
  static String token = "token";
  static String loginData = "login-data";
  static String name = "Name";
  static String username = "Username";
  static String password = "user123";
  static String email = "user@gmail.com";
  static String telp = "08123456789";
  static String tanggalLahir = "10-Juli-2000";
  static int lapangan = 0;

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
    bool isLoginCache = (await SharedPreferences.getInstance()).getBool(isLogin);
    return isLoginCache != null ? true : null;
  }

  static changeData(name, telp, password, email){
    Me.name = name;
    Me.telp = telp;
    Me.password = password;
    Me.email = email;
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    lapangan = 0;
    name = "user";
    password = "user123";
    email = "user@gmail.com";
    telp = "08123456789";
  }
}
