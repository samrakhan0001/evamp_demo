import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/api_helper/api_end_points.dart';
import 'package:flutter_assignment/shared_prefrences/share_prefrence.dart';
import 'package:get/get.dart';

import '../../models/items_list_model.dart';
import '../../screens/items_list_screen.dart';

class List_Items_Controller extends GetxController{

  ItemsApiModel? itemsApiModel;

  RxBool loading_status_list = false.obs;

  Share_prefrence share_prefrence = Share_prefrence();

  var itemresponse={
    "status": "success",
    "items": [
      {
        "id": "1",
        "itemImage": "https://picsum.photos/id/117/1544/1024",
        "name": "Shirt",
        "description": "Causal Office White Shirts For Mens",
        "price": 1349
      },
      {
        "id": "2",
        "itemImage": "https://picsum.photos/id/118/1500/1000",
        "name": "Shoes",
        "description": "Cozy Shoes for men Loafers moccassion high quality",
        "price": 900
      },
      {
        "id": "3",
        "itemImage": "https://picsum.photos/id/118/1500/1000",
        "name": "Bags",
        "description": "Cozy Bags for men Loafers moccassion high quality",
        "price": 1900
      }

    ]
  };

  callingListApi ({context}) async {
    loading_status_list.value = true;
    String useremail= await share_prefrence.get_useremail();
    String token= await share_prefrence.get_token();
    var sendResponse={"email":"$useremail", "token":"$token"};

    try {
      var response = await Dio().post(
        Api_Endpoints.list_items,
        data: jsonEncode(sendResponse),
        options: Options(
          headers: {
            'Content-Type': 'application/json'
          },
        ),
      );

      debugPrint("${response.toString()}");

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

    //because api not working

    itemsApiModel = ItemsApiModel.fromJson(itemresponse);

    loading_status_list.value = false;


    Navigator.pushReplacement(
      context,MaterialPageRoute(builder: (context) => Items_List_Screen()),);
  }



}

