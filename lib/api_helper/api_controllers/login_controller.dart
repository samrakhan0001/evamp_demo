
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/profile_screen.dart';
import 'package:flutter_assignment/shared_prefrences/share_prefrence.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/login_model.dart';
import '../api_end_points.dart';
class Login_Controller  extends GetxController {

  Share_prefrence share_prefrence = Share_prefrence();
  LoginApiModel? loginApiModel;
  RxBool loading_status_login = false.obs;

  callingLoginApi({context,useremail,password}) async {

    loading_status_login.value = true;

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

        loading_status_login.value = false;

        Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => Profile_Screen(loginApiModel)),);
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

    //because api is not working


    var response = {
      "status": "success",
      "userInfo": {
        "token": "ey]hbGciOiJIUzUxMaJ9.eyj2dNT1012@ZXNDMSISINVACCI5NTU30D0xMDONTCAMzkyNDIztO",
        "profileImage": "https://picsum.photos/seed/picsum/400",
        "name": "John Doe",
        "email": "demo@evampsaanga.com",
        "welcomeMessage": "welcome to ESS demo Application, We are Looking forward to review your completed task.",
      }
    };

    loginApiModel = LoginApiModel.fromJson(response);

    share_prefrence.set_LoginStatus(true);
    share_prefrence.set_useremail(loginApiModel!.userInfo!.email!);
    share_prefrence.set_token(loginApiModel!.userInfo!.token!);
    loading_status_login.value = false;


    Navigator.pushReplacement(
      context,MaterialPageRoute(builder: (context) => Profile_Screen(loginApiModel!)),);
  }
}
