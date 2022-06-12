import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/api_helper/api_controllers/list_item_controller.dart';
import 'package:flutter_assignment/models/login_model.dart';
import 'package:flutter_assignment/resources/colors.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

import '../basic_components.dart';

class Profile_Screen extends StatefulWidget {
  LoginApiModel loginApiModel;
  Profile_Screen(this.loginApiModel, {Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState(this.loginApiModel);
}

class _Profile_ScreenState extends State<Profile_Screen> {
  _Profile_ScreenState(LoginApiModel loginApiModel);

  List_Items_Controller list_items_controller = Get.put(List_Items_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: body_widget(),
    ));
  }

  Widget body_widget(){
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: 0,left: 0,right: 0,
              child: top_bar(context,"Profile")),
          ListView(
            shrinkWrap: true,
            children: [
              profile_info(),
              body_text(),
              explore_button(),
              SizedBox(height: 50,),
            ],
          ),
        ],
      )
    );
  }



  Widget profile_info(){
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: 50),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: ImageNetwork(
              image: widget.loginApiModel.userInfo!.profileImage.toString(),
              height: 200,
              width: 200,
              duration: 1500,
              curve: Curves.easeIn,
              onPointer: true,
              debugPrint: false,
              fullScreen: false,
              fitAndroidIos: BoxFit.cover,
              fitWeb: BoxFitWeb.cover,
              onLoading: const CircularProgressIndicator(
                color: Colors.indigoAccent,
              ),
              onError: Image.asset("assets/images/profile.png",height: 150,width: 200,),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        //  Image.asset("assets/images/profile.png",height: 150,width: 200,),
          SizedBox(height: 30,),
          Text("${widget.loginApiModel.userInfo!.name}",style: TextStyle(color: light_blue,fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("${widget.loginApiModel.userInfo!.email}",style: TextStyle(color: light_blue,fontSize: 20),),
        ],
      ),
    );
  }

  Widget  body_text(){
    return Container(
      padding: EdgeInsets.only(left: 50,right: 50),
      child: Column(
        children: [
          Text("Welcome to Demo App",style: TextStyle(color: light_blue,fontSize: 20),),
          SizedBox(height: 10,),
          Text("${widget.loginApiModel.userInfo!.welcomeMessage}",
          style: TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center,)
        ],
      ),
    );
  }


  Widget explore_button(){
    return Obx((){
      return list_items_controller.loading_status_list.value==true?Center(child: CircularProgressIndicator(),):
      Container(
        height: 80,
        padding: EdgeInsets.only(top: 30,bottom:0,left: 100,right: 100),
        child: ElevatedButton(
          child: Text("Explore More",style: TextStyle(fontSize: 20),),
          onPressed: () {
            list_items_controller.callingListApi(context: context);
          },
          style: ElevatedButton.styleFrom(

            primary: primary,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
          ),
        ),
      );
    });
  }
}
