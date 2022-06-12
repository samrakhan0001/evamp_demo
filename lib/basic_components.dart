

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/resources/colors.dart';

Widget top_bar(BuildContext context){
  return Container(
   // margin: EdgeInsets.only(top: 120),
    padding: EdgeInsets.all(20),
    height: 100,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu,color: light_blue,),
        Text("Profile",style: TextStyle(color: light_blue,fontSize: 20),),
        Icon(Icons.search,color: light_blue,),

      ],
    ),
  );
}