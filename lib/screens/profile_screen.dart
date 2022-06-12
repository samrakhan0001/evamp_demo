import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/resources/colors.dart';

import '../basic_components.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
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
              child: top_bar(context)),
          ListView(
            shrinkWrap: true,
            children: [
              profile_info(),
              body_text(),
              explore_button(),
            ],
          ),
        ],
      )
    );
  }



  Widget profile_info(){
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30,top: 100,bottom: 30),
      child: Column(
        children: [
          Image.asset("assets/images/profile.png",height: 150,width: 200,),
          SizedBox(height: 10,),
          Text("John Dow",style: TextStyle(color: light_blue,fontSize: 25),),
          SizedBox(height: 10,),
          Text("John@email.com",style: TextStyle(color: light_blue,fontSize: 20),),
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
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center,)
        ],
      ),
    );
  }


  Widget explore_button(){
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 30,bottom:50,left: 100,right: 100),
      child: ElevatedButton(
        child: Text("Explore More",style: TextStyle(fontSize: 20),),
        onPressed: () {

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
  }
}
