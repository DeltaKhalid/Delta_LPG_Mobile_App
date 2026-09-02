
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login_model.dart';

class AuthUtility {
  AuthUtility._();  /// Single Tone Object Creator, we have to use "static" key word in front of our method or function
  static LoginModel userInfo = LoginModel();

  // Static variable for StartTime
  static String? startTimeIntoSharedPreference;

  ///============================================= Login User info Related Functions ==============================================///

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setString('user-data', jsonEncode(model.toJson()));
    userInfo = model; // Update the static variable
    print('User Info Saved: ${userInfo.toJson()}');
  }


  // static Future<void> saveUserInfo(LoginModel model) async{
  //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
  //   //_shairedPrefs.setDouble('user-data', model.toJson().toString() as double);
  //   //await _shairedPrefs.setString('user-data', model.toJson().toString());
  //   await _shairedPrefs.setString('user-data', jsonEncode(model.toJson()));
  //   userInfo = model;
  //
  //   //String userNameforApiCall = AuthUtility.userInfo.data?.username ?? '';
  //   //String appUserName = userInfo.data?.username ?? '';
  //   String appUserName = userInfo.data?.username ?? '';
  //   String appUserToken = userInfo.data?.token ?? '';
  //   print('App UserName for API call Test 009: $appUserName');
  //
  // }

  ///---------- get userInfo ----------///

  static Future<LoginModel> getUserInfo() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    String? value = _sharedPrefs.getString('user-data');
    if (value != null) {
      userInfo = LoginModel.fromJson(jsonDecode(value));
      print('User Info Retrieved: ${userInfo.toJson()}');
    } else {
      print('No User Info Found in SharedPreferences');
    }
    return userInfo;
  }


  // static Future<LoginModel> getUserInfo() async{
  //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
  //   String value  = _shairedPrefs.getString('user-data')!;
  //   //LoginModel model = LoginModel.fromJson(jsonDecode(value));
  //   return LoginModel.fromJson(jsonDecode(value));
  // }

  /// ---------- Clear User Info ----------///
  static Future<void> clearUserInfo() async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    await _shairedPrefs.clear();
    startTimeIntoSharedPreference = "00.00"; // Clear the startTime variable as well
  }

  /// old code check If User LoggedIn
  // static Future<bool> checkIfUserLoggedIn() async{
  //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
  //   return await _shairedPrefs.containsKey('user-data');
  // }

  ///--- new code of check If User LoggedIn ---///
  static Future<bool> checkIfUserLoggedIn() async{
    SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
    //return await _shairedPrefs.containsKey('user-data');
    bool isLogin = _shairedPrefs.containsKey('user-data');
    if (isLogin) {
      userInfo = await getUserInfo();
    }
    return isLogin;
  }

  ///============================================= Start Time of User Related Functions ==============================================///
  /// --- Save StartTime ---///
  static Future<void> saveStartTime(String time) async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setString('start-time', time);
    startTimeIntoSharedPreference = time; // Update the static variable
    print('Start Time Saved: $time');
  }

  ///--- Get StartTime ---///
  static Future<String?> getStartTime() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    startTimeIntoSharedPreference = _sharedPrefs.getString('start-time'); // Update the static variable
    print('Retrieved Start Time: $startTimeIntoSharedPreference');
    return startTimeIntoSharedPreference;
  }

  ///--- Clear StartTime ---///
  static Future<void> clearStartTime() async {
    SharedPreferences _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.remove('start-time');
    startTimeIntoSharedPreference = null; // Clear the static variable
    print('Start Time Cleared');
  }


}


































//
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login_model.dart';
//
// class AuthUtility {
//   AuthUtility._();  /// Single Tone Object Creator, we have to use "static" key word in front of our method or function
//   static LoginModel userInfo = LoginModel();
//
//
//   static Future<void> saveUserInfo(LoginModel model) async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     //_shairedPrefs.setDouble('user-data', model.toJson().toString() as double);
//     //await _shairedPrefs.setString('user-data', model.toJson().toString());
//     await _shairedPrefs.setString('user-data', jsonEncode(model.toJson()));
//   }
//
//   static Future<LoginModel> getUserInfo() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     String value  = _shairedPrefs.getString('user-data')!;
//     //LoginModel model = LoginModel.fromJson(jsonDecode(value));
//     return LoginModel.fromJson(jsonDecode(value));
//   }
//
//   static Future<void> clearUserInfo() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     await _shairedPrefs.clear();
//   }
//
//   /// old code checkIfUserLoggedIn
//   // static Future<bool> checkIfUserLoggedIn() async{
//   //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//   //   return await _shairedPrefs.containsKey('user-data');
//   // }
//   /// new code of checkIfUserLoggedIn
//   static Future<bool> checkIfUserLoggedIn() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     //return await _shairedPrefs.containsKey('user-data');
//     bool isLogin = _shairedPrefs.containsKey('user-data');
//     if (isLogin) {
//       userInfo = await getUserInfo();
//     }
//     return isLogin;
//   }
//
//
// }





































// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'login_model.dart';
//
// class AuthUtility {
//   AuthUtility._();  /// Single Tone Object Creator, we have to use "static" key word in front of our method or function
//   static LoginModel userInfo = LoginModel();
//
//
//   static Future<void> saveUserInfo(LoginModel model) async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     //_shairedPrefs.setDouble('user-data', model.toJson().toString() as double);
//     //await _shairedPrefs.setString('user-data', model.toJson().toString());
//     await _shairedPrefs.setString('user-data', jsonEncode(model.toJson()));
//   }
//
//   static Future<LoginModel> getUserInfo() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     String value  = _shairedPrefs.getString('user-data')!;
//     //LoginModel model = LoginModel.fromJson(jsonDecode(value));
//     print(value);
//     return LoginModel.fromJson(jsonDecode(value));
//   }
//
//   static Future<void> clearUserInfo() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     await _shairedPrefs.clear();
//   }
//
//   /// old code checkIfUserLoggedIn
//   static Future<bool> checkIfUserLoggedIn() async{
//     SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
//     return await _shairedPrefs.containsKey('user-data');
//   }
//
// // static Future<bool> checkIfUserLoggedIn() async{
// //   SharedPreferences _shairedPrefs = await SharedPreferences.getInstance();
// //   bool isLongin = _shairedPrefs.containsKey('user-data');
// //   if (isLongin) {
// //     userInfo = await getUserInfo(LoginModel as LoginModel);
// //   }
// //   return isLongin;
// // }
//
//
// }