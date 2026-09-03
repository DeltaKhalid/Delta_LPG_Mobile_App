import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login_model.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userInfo = LoginModel();
  static String? startTimeIntoSharedPreference;

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user-data', jsonEncode(model.toJson()));
    userInfo = model;
  }

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('user-data');
    if (value != null) {
      userInfo = LoginModel.fromJson(jsonDecode(value));
    }
    return userInfo;
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    startTimeIntoSharedPreference = null;
  }

  static Future<bool> checkIfUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.containsKey('user-data');
    if (isLogin) {
      userInfo = await getUserInfo();
    }
    return isLogin;
  }

  static Future<void> saveStartTime(String time) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('start-time', time);
    startTimeIntoSharedPreference = time;
  }

  static Future<String?> getStartTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    startTimeIntoSharedPreference = prefs.getString('start-time');
    return startTimeIntoSharedPreference;
  }

  static Future<void> clearStartTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('start-time');
    startTimeIntoSharedPreference = null;
  }
}