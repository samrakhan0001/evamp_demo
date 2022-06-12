import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../models/items_list_model.dart';

callingListApi ({context}) async {
  String useremail="jo save wo do";
  String token="jo save wo do";
  var sendResponse={"email":"$useremail", "token":"$token"};

  try {
    var response = await Dio().post(
      "http://115.186.58.59:8080/demo_es/getItems",
      data: jsonEncode(sendResponse),
      options: Options(
        headers: {
          'Content-Type': 'application/json'
        },
      ),
    );

    print("${response.toString()}");

    if (response.data["status"].toString().contains("success")) {
      debugPrint("items success");
      ItemsApiModel itemsApiModel = ItemsApiModel.fromJson(response.data);
      //now get list and show into widget
      //navigate and save data
    } else {
      debugPrint("items fail");
    }

    return true;
  } on DioError catch (e) {
    print("error");
    print(e.toString());
    print(e.message);
    if (DioErrorType.receiveTimeout == e.type ||
        DioErrorType.connectTimeout == e.type) {
      print(e.message);
      return false;
    } else if (DioErrorType.response == e.type) {
      print(e.message);
    } else if (DioErrorType.sendTimeout == e.type) {
      print("else==${e.message}");
    } else {
      print("else==${e.toString()}");

    }
    print("aaa==${e.message}");


    print("catch==${e.message}");
  }
}