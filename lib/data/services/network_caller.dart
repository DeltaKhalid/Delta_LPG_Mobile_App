



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