import 'dart:developer';

import 'package:get/get.dart';

import '../../data/models/auth/login_model.dart';
import '../../data/models/network_response/network_response.dart';
import '../../data/models/shared_preference/auth_utility.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class LoginController extends GetxController {

  bool _loginAPiCallInProgress = false;
  bool get loginInProgress => _loginAPiCallInProgress;

  String? errorMessage;

  Future<bool> loginAPI(String userName, String password) async {

    print('login GetX controller is called');
    _loginAPiCallInProgress = true;
    update();

    Map<String, String> requestBody = {
      "zemail": "000001@bulkcortrading.com", // was hardcoded before
      "zid": userName, // TODO: confirm with backend if this is always fixed, or should vary per user/business
      "xpassword": password,
    };
    // Map<String, String> requestBody = {
    //   "zemail": email.trim(),
    //   "zid": "100000", // TODO: confirm with backend if this is always fixed, or should vary per user/business
    //   "xpassword": password,
    // };

    final NetworkResponse response = await NetworkCaller().postFormRequest(Urls.login, requestBody, isLogin: true);

    print('9999 : ${response.body}');
    log('data 2 : ${response.body}');

    _loginAPiCallInProgress = false;
    update(); // update UI

    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      print('Name : ${model.data?.user?.xname}');
      print('Email : ${model.data?.user?.zemail}');
      print('User VAN : ${model.data?.user?.xwh}');
      print('Access Token : ${model.data?.accessToken}');

      await AuthUtility.saveUserInfo(model);

      print('Name from SharedPreference: ${AuthUtility.userInfo.data?.user?.xname}');
      print('VAN from SharedPreference: ${AuthUtility.userInfo.data?.user?.xwh}');

      return true;
    } else {
      //errorMessage = response.errorMessage ?? 'Incorrect User Name or Password';
      return false;
    }
  }
}












//
//
// import 'dart:developer';
//
// import 'package:get/get.dart';
//
// import '../../data/models/auth/login_model.dart';
// import '../../data/models/network_response/network_response.dart';
// import '../../data/models/shared_preference/auth_utility.dart';
// import '../../data/services/network_caller.dart';
// import '../../data/utils/urls.dart';
//
// class LoginController  extends GetxController {
//
//   bool _loginAPiCallInProgress = false;
//   bool get loginInProgress => _loginAPiCallInProgress;
//
//   Future<bool> loginAPI(String email, String password) async{
//
//     print('login controller is called');
//     _loginAPiCallInProgress = true;
//
//     update();
//
//
//     Map<String, String> requestBody = {
//       //"zemail": _userNameTEController.text.trim(), // was hardcoded before
//       "zemail": "000001@bulkcortrading.com", // was hardcoded before
//       //"zid": "100000", // confirm this is fixed, or make it a field if it varies per user
//       "zid": _userNameTEController.text.trim(), // confirm this is fixed, or make it a field if it varies per user
//       "xpassword": _passwordTEController.text,
//     };
//     // Map<String, dynamic> requestBody = {
//     //   "username": email,
//     //   "password": password
//     // };
//
//     final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, requestBody, isLogin: true);
//
//     print('9999 : ${response.body}');
//     log('data 2 : ${response.body}');
//
//     _loginAPiCallInProgress = false;
//
//     update(); // update UI
//     // if (mounted) {
//     //   setState(() {});
//     // }
//
//     /// Network call is End
//     if (response.isSuccess) {
//
//       // Login info check method
//       LoginModel model = LoginModel.fromJson(response.body!);     /// ! -> used for forsed not null
//       print('Name : ${model.data?.user?.xname}');
//       print('Email : ${model.data?.user?.zemail}');
//       print('User VAN : ${model.data?.user?.xwh}');
//       print('Access Token : ${model.data?.accessToken}');
//       //await AuthUtility.clearUserInfo();
//       await AuthUtility.saveUserInfo(model);
//       print('Name from SharedPreference: ${AuthUtility.userInfo.data?.user?.xname}');
//       print('VAN from SharedPreference: ${AuthUtility.userInfo.data?.user?.xwh}');
//
//       // LoginModel model = LoginModel.fromJson(response.body!);     /// ! -> used for forsed not null
//       // print(model.data?.username);
//       // print('User Name 999 : ${AuthUtility.userInfo.data?.firstName}');
//       // await AuthUtility.saveUserInfo(model);
//
//       return true;
//       // if (mounted) {
//       //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
//       //   //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const HomeScreen(),),),);
//       // }
//
//
//
//
//
//     }else {
//
//       return false;
//       // if (mounted) {
//       //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect User Name or Password')));
//       // }
//
//     }
//
//   }
//
//
//
// }