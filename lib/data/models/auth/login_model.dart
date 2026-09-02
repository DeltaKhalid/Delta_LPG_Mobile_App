class LoginModel {
  String? status;
  String? token;
  LoginData? data;

  LoginModel({this.status, this.token, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  int? id;
  String? username;
  Null? lastLogin;
  bool? isSuperuser;
  bool? isStaff;
  bool? isActive;
  String? firstName;
  String? email;
  String? dateJoined;
  String? image;
  int? designationId;
  Null? xaccess;
  Null? zone;
  Null? accessControl;
  String? userType;
  Null? homeLat;
  Null? homeLong;
  Null? homeAddress;
  Null? userRole;
  bool? isAdmin;
  bool? isSales;
  int? zid;

  LoginData(
      {this.id,
        this.username,
        this.lastLogin,
        this.isSuperuser,
        this.isStaff,
        this.isActive,
        this.firstName,
        this.email,
        this.dateJoined,
        this.image,
        this.designationId,
        this.xaccess,
        this.zone,
        this.accessControl,
        this.userType,
        this.homeLat,
        this.homeLong,
        this.homeAddress,
        this.userRole,
        this.isAdmin,
        this.isSales,
        this.zid});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    firstName = json['first_name'];
    email = json['email'];
    dateJoined = json['date_joined'];
    image = json['image'];
    designationId = json['designation_id'];
    xaccess = json['xaccess'];
    zone = json['zone'];
    accessControl = json['access_control'];
    userType = json['user_type'];
    homeLat = json['home_lat'];
    homeLong = json['home_long'];
    homeAddress = json['home_address'];
    userRole = json['user_role'];
    isAdmin = json['is_admin'];
    isSales = json['is_sales'];
    zid = json['zid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['first_name'] = this.firstName;
    data['email'] = this.email;
    data['date_joined'] = this.dateJoined;
    data['image'] = this.image;
    data['designation_id'] = this.designationId;
    data['xaccess'] = this.xaccess;
    data['zone'] = this.zone;
    data['access_control'] = this.accessControl;
    data['user_type'] = this.userType;
    data['home_lat'] = this.homeLat;
    data['home_long'] = this.homeLong;
    data['home_address'] = this.homeAddress;
    data['user_role'] = this.userRole;
    data['is_admin'] = this.isAdmin;
    data['is_sales'] = this.isSales;
    data['zid'] = this.zid;
    return data;
  }
}







///--- old code ---///

// import 'dart:developer';
//
// class LoginModel {
//   String? status;
//   String? token;
//   LoginData? data;
//
//   LoginModel({this.status, this.token, this.data});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     token = json['token'];
//     data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['token'] = this.token;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class LoginData {
//   int? id;
//   String? username;
//   String? email;
//   String? token;
//   int? designationId;
//   String? firstName;
//   String? lastName;
//   bool? isActive;
//   String? access;
//   Null? zone;
//   String? image;
//   String? accessControl;
//   String? userType;
//   Null? homeLat;
//   Null? homeLong;
//   Null? ziId;
//   Null? ciId;
//   String? xwh;
//
//   LoginData(
//       {this.id,
//         this.username,
//         this.email,
//         this.token,
//         this.designationId,
//         this.firstName,
//         this.lastName,
//         this.isActive,
//         this.access,
//         this.zone,
//         this.image,
//         this.accessControl,
//         this.userType,
//         this.homeLat,
//         this.homeLong,
//         this.ziId,
//         this.ciId,
//         this.xwh});
//
//   LoginData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     username = json['username'];
//     email = json['email'];
//     token = json['token'];
//     designationId = json['designation_id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     isActive = json['is_active'];
//     access = json['access'];
//     zone = json['zone'];
//     image = json['image'];
//     accessControl = json['access_control'];
//     userType = json['user_type'];
//     homeLat = json['home_lat'];
//     homeLong = json['home_long'];
//     ziId = json['zi_id'];
//     ciId = json['ci_id'];
//     xwh = json['xwh'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['username'] = this.username;
//     data['email'] = this.email;
//     data['token'] = this.token;
//     data['designation_id'] = this.designationId;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['is_active'] = this.isActive;
//     data['access'] = this.access;
//     data['zone'] = this.zone;
//     data['image'] = this.image;
//     data['access_control'] = this.accessControl;
//     data['user_type'] = this.userType;
//     data['home_lat'] = this.homeLat;
//     data['home_long'] = this.homeLong;
//     data['zi_id'] = this.ziId;
//     data['ci_id'] = this.ciId;
//     data['xwh'] = this.xwh;
//     return data;
//   }
// }



