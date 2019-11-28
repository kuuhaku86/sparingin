import 'package:shared_preferences/shared_preferences.dart';
import 'package:sparingin/src/utils/team.dart';

class Me {
  static String isLogin = "isLogin";
  static String token = "token";
  static String loginData = "login-data";
  static String name = "Name";
  static String username = "Username";
  static String password = "user123";
  static String email = "user@gmail.com";
  static String telp = "08123456789";
  static DateTime tanggalLahir = DateTime(2000,6,16,);
  static int lapangan = 0;
  static bool register = false;
  static int team = 3;
  static String tempName = "Name";
  static String tempTelp = "08123456789";
  static String tempPassword = "user123";
  static String tempEmail = "user@gmail.com";
  static DateTime tempTanggalLahir = DateTime(2000,6,16,);

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

  static changeData(name, telp, password, email,bool register){
    if(register) {
      Me.name = name;
      Me.telp = telp;
      Me.password = password;
      Me.email = email;
    }else{
      Me.tempName = name;
      Me.tempTelp = telp;
      Me.tempPassword = password;
      Me.tempEmail = email;
    }
  }

  static logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Me.lapangan = 0;
    Me.name = "user";
    Me.password = "user123";
    Me.email = "user@gmail.com";
    Me.telp = "08123456789";
    Me.register = false;
    Me.tanggalLahir = DateTime(2000,6,16,);
    Me.tempTanggalLahir = DateTime(2000,6,16,);
    Me.team = 3;
    listTeam[team].teamPlayer.removeLast();
  }
}

