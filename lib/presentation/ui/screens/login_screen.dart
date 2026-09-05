import 'dart:developer';

import 'package:delta_lpg_product_sale/presentation/ui/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../data/models/auth/login_model.dart';
import '../../../data/models/network_response/network_response.dart';
import '../../../data/models/shared_preference/auth_utility.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../../state_holders/login_controller.dart';
import '../utils/app_colors.dart';
import 'home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  ///======================================== GetX Controller Instance =====================================================================///
  //final LoginController _loginController = Get.put(LoginController());
  final LoginController _loginController = Get.find<LoginController>();

  bool _isObscure = true;


  ///======================================== All Variables ================================================================================///


  ///---------- login credential taker (userName and password TextFormField) ----------///
  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _userNameTEController.dispose();
    _passwordTEController.dispose();

    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  ///---------- Form Validation ----------///
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  /// -------------------------------------- All Variables --------------------------------
  bool _loginAPiCallInProgress = false;


  ///================================================================ initState ================================================ ///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userNameTEController.clear();
    _passwordTEController.clear();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   loginAPI();
    // });

  }

  /// =============================================================== Login API Call =========================================== ///


  ///----------------------------------------  Login API Call, Now Using Get X ----------///
  Future<void> loginAPI() async {

    print('login function is called');
    _loginAPiCallInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, String> requestBody = {
      //"zemail": _userNameTEController.text.trim(), // was hardcoded before
      "zemail": "000001@bulkcortrading.com", // was hardcoded before
      //"zid": "100000", // confirm this is fixed, or make it a field if it varies per user
      "zid": _userNameTEController.text.trim(), // confirm this is fixed, or make it a field if it varies per user
      "xpassword": _passwordTEController.text,
    };

    // Map<String, String> requestBody = {
    //   "zemail": _userNameTEController.text.trim(), // was hardcoded before
    //   "zid": "100000", // confirm this is fixed, or make it a field if it varies per user
    //   "xpassword": _passwordTEController.text,
    // };

    final NetworkResponse response = await NetworkCaller().postFormRequest(Urls.login, requestBody, isLogin: true);

    print('9999 : ${response.body}');
    log('data 2 : ${response.body}');

    _loginAPiCallInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      print('Name : ${model.data?.user?.xname}');
      print('Email : ${model.data?.user?.zemail}');
      print('User VAN : ${model.data?.user?.xwh}');
      print('Access Token : ${model.data?.accessToken}');
      await AuthUtility.saveUserInfo(model);
      print('Name from SharedPreference: ${AuthUtility.userInfo.data?.user?.xname}');
      print('VAN from SharedPreference: ${AuthUtility.userInfo.data?.user?.xwh}');

      if (mounted) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect User Name or Password')));
      }
    }
  }






  ///----------------------------------------  Login API Call, Now Using Get X ----------///
  // Future<void> loginAPI() async{
  //
  //   print('login function is called');
  //   _loginAPiCallInProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   Map<String, dynamic> requestBody = {
  //     "zemail": "000001@bulkcortrading.com",
  //     "zid": _userNameTEController.text.trim(),
  //     "xpassword": _passwordTEController.text
  //   };
  //   final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, requestBody, isLogin: true);
  //
  //   print('9999 : ${response.body}');
  //   log('data 2 : ${response.body}');
  //
  //   _loginAPiCallInProgress = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   /// Network call is End
  //   if (response.isSuccess) {
  //
  //     // Login info check method
  //     LoginModel model = LoginModel.fromJson(response.body!);     /// ! -> used for forsed not null
  //     print('Name : ${model.data?.user?.xname}');
  //     print('Email : ${model.data?.user?.zemail}');
  //     print('User VAN : ${model.data?.user?.xwh}');
  //     print('Access Token : ${model.data?.accessToken}');
  //     //await AuthUtility.clearUserInfo();
  //     await AuthUtility.saveUserInfo(model);
  //     print('Name from SharedPreference: ${AuthUtility.userInfo.data?.user?.xname}');
  //     print('VAN from SharedPreference: ${AuthUtility.userInfo.data?.user?.xwh}');
  //
  //     // LoginModel model = LoginModel.fromJson(response.body!);     /// ! -> used for forsed not null
  //     // print(model.data?.username);
  //     // print('User Name 999 : ${AuthUtility.userInfo.data?.firstName}');
  //     // await AuthUtility.saveUserInfo(model);
  //
  //     if (mounted) {
  //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeScreen()), (route) => false);
  //       //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const HomeScreen(),),),);
  //     }
  //   }else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incorrect User Name or Password')));
  //     }
  //   }
  //
  // }



  /// =============================================================== UI ======================================================= ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: AnimatedPadding(
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [

              ///---------- Welcome Text Area ----------///
              SafeArea(
                bottom: false,

                child: Padding(

                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Column(
                    children: const [
                      SizedBox(height: 50),
                      Image(
                        image: AssetImage('assets/images/logo_delta_lpg.png'),
                        height: 80,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Welcome to Delta LPG',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ///---------- Logo Area ----------///

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _userNameTEController,
                      focusNode: _emailFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
                      decoration: InputDecoration(
                        labelText: 'EMAIL ADDRESS',
                        hintText: 'example@gmail.com',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordTEController,
                      focusNode: _passwordFocus,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _passwordFocus.unfocus(),
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        hintText: '********',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                    const SizedBox(height: 30),

                    /// -------------------------- Login Button ------------------------ ///
                    /// -------------------------- Login Button ------------------------ ///
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          //loginAPI();

                          //_loginController.loginAPI("email", "password");
                          //_loginController.loginAPI("100000", "bcor1234");
                          _loginController.loginAPI(_userNameTEController.text.trim(), _passwordTEController.text.toString());

                          // --- Login API Call from
                          // _loginController.loginAPI(
                          //   _userNameTEController.text.trim(),
                          //   _passwordTEController.text,
                          // );


                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),





                    // SizedBox(
                    //   width: double.infinity,
                    //   height: 48,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor: AppColors.primaryButtonColor,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //       ),
                    //     ),
                    //     onPressed: () {
                    //       loginAPI(); // Login API call
                    //       Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(builder: (context) => const HomeScreen()),
                    //             (route) => false,
                    //       );
                    //     },
                    //     child: const Text(
                    //       'Login',
                    //       style: TextStyle(fontSize: 16, color: Colors.white),
                    //     ),
                    //   ),
                    // ),




                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                      );
                    },
                    child: const Text(
                      'Back to Registration',
                      style: TextStyle(
                        color: AppColors.textColorGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}



