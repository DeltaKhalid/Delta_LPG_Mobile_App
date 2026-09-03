class LoginModel {
  bool? success;
  int? statusCode;
  String? message;
  LoginData? data;
  String? path;
  String? timestamp;

  LoginModel(
      {this.success,
        this.statusCode,
        this.message,
        this.data,
        this.path,
        this.timestamp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
    path = json['path'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['path'] = this.path;
    data['timestamp'] = this.timestamp;
    return data;
  }
}

class LoginData {
  String? accessToken;
  String? refreshToken;
  User? user;

  LoginData({this.accessToken, this.refreshToken, this.user});

  LoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? zemail;
  int? zid;
  String? xname;
  String? xaccess;
  String? xmodules;
  Null? xhome;
  String? xphone;
  String? xmobile;
  String? xlanguage;
  String? xdformat;
  String? xdsep;
  String? xtooltips;
  String? xautoshow;
  String? xsingleses;
  String? xwh;
  Null? xdiv;
  Null? xproj;
  String? xassetid;
  Business? business;

  User(
      {this.zemail,
        this.zid,
        this.xname,
        this.xaccess,
        this.xmodules,
        this.xhome,
        this.xphone,
        this.xmobile,
        this.xlanguage,
        this.xdformat,
        this.xdsep,
        this.xtooltips,
        this.xautoshow,
        this.xsingleses,
        this.xwh,
        this.xdiv,
        this.xproj,
        this.xassetid,
        this.business});

  User.fromJson(Map<String, dynamic> json) {
    zemail = json['zemail'];
    zid = json['zid'];
    xname = json['xname'];
    xaccess = json['xaccess'];
    xmodules = json['xmodules'];
    xhome = json['xhome'];
    xphone = json['xphone'];
    xmobile = json['xmobile'];
    xlanguage = json['xlanguage'];
    xdformat = json['xdformat'];
    xdsep = json['xdsep'];
    xtooltips = json['xtooltips'];
    xautoshow = json['xautoshow'];
    xsingleses = json['xsingleses'];
    xwh = json['xwh'];
    xdiv = json['xdiv'];
    xproj = json['xproj'];
    xassetid = json['xassetid'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zemail'] = this.zemail;
    data['zid'] = this.zid;
    data['xname'] = this.xname;
    data['xaccess'] = this.xaccess;
    data['xmodules'] = this.xmodules;
    data['xhome'] = this.xhome;
    data['xphone'] = this.xphone;
    data['xmobile'] = this.xmobile;
    data['xlanguage'] = this.xlanguage;
    data['xdformat'] = this.xdformat;
    data['xdsep'] = this.xdsep;
    data['xtooltips'] = this.xtooltips;
    data['xautoshow'] = this.xautoshow;
    data['xsingleses'] = this.xsingleses;
    data['xwh'] = this.xwh;
    data['xdiv'] = this.xdiv;
    data['xproj'] = this.xproj;
    data['xassetid'] = this.xassetid;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    return data;
  }
}

class Business {
  int? zid;

  Business({this.zid});

  Business.fromJson(Map<String, dynamic> json) {
    zid = json['zid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zid'] = this.zid;
    return data;
  }
}
