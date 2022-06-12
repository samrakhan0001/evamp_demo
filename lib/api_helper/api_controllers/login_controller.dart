
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../models/login_model.dart';
import '../api_end_points.dart';
class Login_Controller{
  callingLoginApi({context,useremail,password}) async {
    var sendResponse={"userEmail":"$useremail", "password":"$password"};
    try {
      var response = await Dio().post(
        Api_Endpoints.login_user,
        data: jsonEncode(sendResponse),
        options: Options(
          headers: {
            'Content-Type': 'application/json'
          },
        ),
      );

      print("${response.toString()}");

      if (response.data["status"].toString().contains("success")) {
        debugPrint("login success");
        LoginApiModel loginApiModel = LoginApiModel.fromJson(response.data);
        //navigate and save data
      } else {
        debugPrint("login fail");
      }

      return true;
    } on DioError catch (e) {
      debugPrint("error");
      debugPrint(e.toString());
      debugPrint(e.message);
      if (DioErrorType.receiveTimeout == e.type ||
          DioErrorType.connectTimeout == e.type) {
        debugPrint(e.message);
        return false;
      } else if (DioErrorType.response == e.type) {
        debugPrint(e.message);
      } else if (DioErrorType.sendTimeout == e.type) {
        debugPrint("else==${e.message}");
      } else {
        debugPrint("else==${e.toString()}");

      }

      debugPrint("catch==${e.message}");
    }
  }
}
