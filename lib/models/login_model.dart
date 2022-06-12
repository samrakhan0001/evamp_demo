class LoginApiModel {
  String? status;
  UserInfo? userInfo;

  LoginApiModel({this.status, this.userInfo});

  LoginApiModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userInfo = json['userInfo'] != null
        ? new UserInfo.fromJson(json['userInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.userInfo != null) {
      data['userInfo'] = this.userInfo!.toJson();
    }
    return data;
  }
}

class UserInfo {
  String? token;
  String? profileImage;
  String? name;
  String? email;
  String? welcomeMessage;

  UserInfo(
      {this.token,
        this.profileImage,
        this.name,
        this.email,
        this.welcomeMessage});

  UserInfo.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    profileImage = json['profileImage'];
    name = json['name'];
    email = json['email'];
    welcomeMessage = json['welcomeMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['profileImage'] = this.profileImage;
    data['name'] = this.name;
    data['email'] = this.email;
    data['welcomeMessage'] = this.welcomeMessage;
    return data;
  }
}