import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../application/app.dart';

import '../../presentation/ui/screens/login_screen.dart';
import '../models/shared_preference/auth_utility.dart';
import '../models/network_response/network_response.dart';



class NetworkCaller {

  late String responseError = '';


  ///---------- POST Request (x-www-form-urlencoded) ----------///
  Future<NetworkResponse> postFormRequest(String url, Map<String, String> body, {bool isLogin = false}) async {
    try {
      log('Request URL: $url');
      log('Request Body (form): $body');

      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body, // http package auto-encodes a Map<String,String> as form data
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(true, response.statusCode, responseBody, null);
      } else {
        responseError = responseBody['message'] ?? responseBody['data']?['error'] ?? 'Unknown error occurred';
        log('Error Message: $responseError');
      }

      return NetworkResponse(false, response.statusCode, responseBody, null);
    } catch (e) {
      log('Error: $e');
      responseError = 'An error occurred: $e';
    }
    return NetworkResponse(false, -1, null, null);
  }





  ///---------- GET Request ----------///
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url), headers: {
        'token': AuthUtility.userInfo.data?.accessToken.toString() ?? '',
      });
      log(response.statusCode.toString());
      log('massage 111 : ${response.statusCode}');
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null, null);
  }


  // Future<NetworkResponse> getRequest(String url) async{
  //   //Map<String, dynamic>? decodedResponse;
  //   try{
  //     Response response = await get(Uri.parse(url), headers: {
  //
  //       // 'token': AuthUtility.userInfo.token.toString(),
  //       'token': AuthUtility.userInfo.data?.accessToken.toString() ?? '',
  //     });
  //     log(response.statusCode.toString());
  //     log('massage 111 : ${response.statusCode}');
  //     log(response.body);
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
  //
  //     }
  //     else if (response.statusCode == 401){
  //       gotoLogin();
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }

  ///---------- GET Request With Token ----------///
  Future<NetworkResponse> getRequestWithToken(String url) async{
    //Map<String, dynamic>? decodedResponse;

    String tokenHead = 'Token ';

    //String token = AuthUtility.userInfo.token.toString();
    String token = AuthUtility.userInfo.data?.accessToken.toString() ?? '';


    //String fullToken = 'Token ${AuthUtility.userInfo.token.toString()}';
    String fullToken = AuthUtility.userInfo.data?.accessToken.toString() ?? '';

    try{
      Response response = await get(Uri.parse(url), headers: {
        //'token': AuthUtility.userInfo.token.toString(),

        'Authorization': 'Token $token',   ///*** it is worked, but when new install it is not work
      });
      log(response.statusCode.toString());
      log('massage 111 : ${response.statusCode}');
      log(response.body);
      if (response.statusCode == 200) {
        //decodedResponse = jsonDecode(response.body);
        //final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
      }
      else if (response.statusCode == 401){
        gotoLogin();
      }
      else {
        //todo - handle other response code - 401,400, 500
        return NetworkResponse(false, response.statusCode, null, null);
      }
    } catch (e) {
      log(e.toString());      ///*** Replace of print method
    }
    return NetworkResponse(false, -1, null, null);

    //return decodedResponse;

    // finally {
    //   return decodedResponse;
    // }
  }

  ///---------- POST Request ----------///
  Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body, {bool isLogin = false}) async {
    try {
      log('Request URL: $url');
      log('Request Body: ${jsonEncode(body)}');

      Response response = await post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          //'Authorization': AuthUtility.userInfo.token.toString(),
          'Authorization': AuthUtility.userInfo.data?.accessToken.toString() ?? '',
        },
        body: jsonEncode(body),
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(true, response.statusCode, responseBody, null);
      } else {
        // Update the `responseError` with the error message from the response body
        responseError = responseBody['data']?['error'] ?? 'Unknown error occurred';
        log('Error Message: $responseError');
      }

      return NetworkResponse(false, response.statusCode, responseBody, null);
    } catch (e) {
      log('Error: $e');
      responseError = 'An error occurred: $e';
    }
    return NetworkResponse(false, -1, null, null);
  }

  ///---------- Old Code of POST Request ---///
  // Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body, {bool isLogin = false}) async{
  //
  //   //Map<String, dynamic>? decodedResponse;
  //   try{
  //     log('body content : ${body.toString()}');
  //     Response response = await post(
  //       Uri.parse(url),
  //       //headers: {'Content-Type': 'application/json'},
  //       headers: {
  //         'Content-Type': 'application/json',
  //         //'token': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header
  //         'Authorization': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header
  //
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     print('Network Caller Class test print 0086: ${response.statusCode.toString()}');
  //     log(response.body);
  //     print('Network Caller Class test print 0087: ${response.body}');
  //
  //
  //     Map<String, dynamic> responseBody = jsonDecode(response.body.toString());
  //     print(' Network Caller Class test print 0088: ${responseBody['data']['error']}');                                       // 555555
  //     responseError = '${responseBody['data']['error']}';
  //     print('Network Caller Class test print 0089: $responseError');
  //
  //
  //     // responseBody['data']?['error'];
  //     // print('test print 0088: ${response.body['data']['error']}');
  //     // log('body content : ${body.toString()}');
  //
  //
  //
  //     if (response.statusCode == 200) {
  //       //decodedResponse = jsonDecode(response.body);
  //       //final decodedResponse = jsonDecode(response.body);
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else if (response.statusCode == 401) {
  //       if (isLogin == false) {
  //         gotoLogin();
  //       }
  //     }
  //     else if (response.statusCode == 201) {
  //       // print('Status Code : ${response.statusCode}');
  //       print("Request successful! from 'Network Caller' ");
  //       // print("Response body: ${response.body}");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     }
  //     else {
  //       //todo - handle other response code - 401,400, 500
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());      ///*** Replace of print method
  //   }
  //   return NetworkResponse(false, -1, null);
  //
  //   //return decodedResponse;
  //   // finally {
  //   //   return decodedResponse;
  //   // }
  // }

  ///---------- POST Request With Token ----------///
  Future<NetworkResponse> postRequestWithToken(String url, Map<String, dynamic> body, {bool isLogin = false}) async{

    String tokenHead = 'Token ';

    //String token = AuthUtility.userInfo.token.toString();
    String token = AuthUtility.userInfo.data?.accessToken.toString() ?? '';

    //String fullToken = 'Token ${AuthUtility.userInfo.token.toString()}';
    String fullToken = AuthUtility.userInfo.data?.accessToken.toString() ?? '';

    //Map<String, dynamic>? decodedResponse;
    try{
      log('body content : ${body.toString()}');
      Response response = await post(
        Uri.parse(url),
        //headers: {'Content-Type': 'application/json'},
        headers: {
          'Content-Type': 'application/json',
          //'token': AuthUtility.userInfo.token.toString(),     ///*** for sending token through Header

          //'Authorization': 'Token 8b6e3d2c29b377667d3435a033c26c93dd34d0c1',     ///*** for sending token through Header  /// It is worked
          //'Authorization': 'fullToken',     ///*** for sending token through Header
          'Authorization': 'Token $token',   ///*** it is worked, but when new install it is not work

        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      log('body content : ${body.toString()}');

      Map<String, dynamic> responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        //decodedResponse = jsonDecode(response.body);
        //final decodedResponse = jsonDecode(response.body);
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
      }
      else{
        // Update the `responseError` with the error message from the response body
        responseError = responseBody['data']?['error'] ?? 'Unknown error occurred';
        log('Error Message: $responseError');
      }

      // else if (response.statusCode == 401) {
      //   if (isLogin == false) {
      //     gotoLogin();
      //   }
      // }
      // else if (response.statusCode == 201) {
      //   // print('Status Code : ${response.statusCode}');
      //   print("Request successful! from 'Network Caller' ");
      //   // print("Response body: ${response.body}");
      //   return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      // }
      // else {
      //   //todo - handle other response code - 401,400, 500
      //   return NetworkResponse(false, response.statusCode, null);
      // }



    } catch (e) {
      log(e.toString());      ///*** Replace of print method
    }
    return NetworkResponse(false, -1, null, null);

    //return decodedResponse;
    // finally {
    //   return decodedResponse;
    // }
  }

  ///---------- PUT Request with Token ----------///
  Future<NetworkResponse> putRequestWithToken(String url, Map<String, dynamic> body) async {

    //String token = AuthUtility.userInfo.token.toString();
    String token = AuthUtility.userInfo.data?.accessToken.toString() ?? '';

    try {
      log('body content : ${body.toString()}');
      Response response = await put(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token',
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      log('body content : ${body.toString()}');
      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else if (response.statusCode == 201) {
        print("Request successful! from 'Network Caller' ");
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body), null);
      } else {
        return NetworkResponse(false, response.statusCode, null, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null, null);
  }

  ///---------- PUT Request Old Code ----------///
  // Future<NetworkResponse> putRequest(String url, Map<String, dynamic> body) async {
  //   try {
  //     log('body content : ${body.toString()}');
  //     Response response = await put(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': AuthUtility.userInfo.token.toString(),
  //       },
  //       body: jsonEncode(body),
  //     );
  //     log(response.statusCode.toString());
  //     log(response.body);
  //     log('body content : ${body.toString()}');
  //     if (response.statusCode == 200) {
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else if (response.statusCode == 401) {
  //       gotoLogin();
  //     } else if (response.statusCode == 201) {
  //       print("Request successful! from 'Network Caller' ");
  //       return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
  //     } else {
  //       return NetworkResponse(false, response.statusCode, null);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  //   return NetworkResponse(false, -1, null);
  // }

  ///---------- 401 Error Handle of login ----------///
  Future<void> gotoLogin() async{
    //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);  ///*** Old code, Error context not found
    await AuthUtility.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        DeltaLPGSalesApp.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
  }

}















// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../../application/app.dart';
// import '../../presentation/ui/screens/login_screen.dart';
// import '../models/shared_preference/auth_utility.dart';
// import '../models/network_response/network_response.dart';
//
// class NetworkCaller {
//   late String responseError = '';
//
//   String get _authHeader =>
//       'Token ${AuthUtility.userInfo.accessToken ?? ''}';
//
//   ///---------- GET Request With Token ----------///
//   Future<NetworkResponse> getRequestWithToken(String url) async {
//     try {
//       Response response = await get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         'Authorization': _authHeader,
//       });
//       log('GET $url → ${response.statusCode}');
//       log(response.body);
//       if (response.statusCode == 200) {
//         return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
//       } else if (response.statusCode == 401) {
//         gotoLogin();
//       }
//       return NetworkResponse(false, response.statusCode, null);
//     } catch (e) {
//       log(e.toString());
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
//   ///---------- POST Request (no auth — used for login) ----------///
//   Future<NetworkResponse> postRequest(String url, Map<String, dynamic> body) async {
//     try {
//       log('POST $url → ${jsonEncode(body)}');
//       Response response = await post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//       log('Response ${response.statusCode}: ${response.body}');
//       final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return NetworkResponse(true, response.statusCode, responseBody);
//       }
//       responseError = responseBody['message'] ?? 'Unknown error';
//       return NetworkResponse(false, response.statusCode, responseBody);
//     } catch (e) {
//       log(e.toString());
//       responseError = 'An error occurred: $e';
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
//   ///---------- POST Request With Token ----------///
//   Future<NetworkResponse> postRequestWithToken(String url, Map<String, dynamic> body) async {
//     try {
//       log('POST $url → ${jsonEncode(body)}');
//       Response response = await post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': _authHeader,
//         },
//         body: jsonEncode(body),
//       );
//       log('Response ${response.statusCode}: ${response.body}');
//       final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return NetworkResponse(true, response.statusCode, responseBody);
//       }
//       responseError = responseBody['message'] ?? 'Unknown error';
//       return NetworkResponse(false, response.statusCode, responseBody);
//     } catch (e) {
//       log(e.toString());
//       responseError = 'An error occurred: $e';
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
//   ///---------- PUT Request With Token ----------///
//   Future<NetworkResponse> putRequestWithToken(String url, Map<String, dynamic> body) async {
//     try {
//       Response response = await put(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': _authHeader,
//         },
//         body: jsonEncode(body),
//       );
//       log('PUT $url → ${response.statusCode}: ${response.body}');
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
//       } else if (response.statusCode == 401) {
//         gotoLogin();
//       }
//       return NetworkResponse(false, response.statusCode, null);
//     } catch (e) {
//       log(e.toString());
//     }
//     return NetworkResponse(false, -1, null);
//   }
//
//   ///---------- 401 Handler ----------///
//   Future<void> gotoLogin() async {
//     await AuthUtility.clearUserInfo();
//     Navigator.pushAndRemoveUntil(
//       DeltaLPGSalesApp.globalKey.currentContext!,
//       PageRouteBuilder(
//         transitionDuration: const Duration(milliseconds: 280),
//         pageBuilder: (_, __, ___) => const LoginScreen(),
//         transitionsBuilder: (_, animation, __, child) {
//           return SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(1.0, 0.0),
//               end: Offset.zero,
//             ).animate(CurvedAnimation(
//               parent: animation,
//               curve: Curves.fastOutSlowIn,
//             )),
//             child: child,
//           );
//         },
//       ),
//       (route) => false,
//     );
//   }
// }