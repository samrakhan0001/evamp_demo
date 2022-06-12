

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/resources/colors.dart';

Widget top_bar(BuildContext context,text){
  return Container(
   // margin: EdgeInsets.only(top: 120),
    padding: EdgeInsets.all(20),
    height: 100,
    width: MediaQuery.of(context).size.width,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu,color: light_blue,),
        Text("$text",style: TextStyle(color: light_blue,fontSize: 23,fontWeight: FontWeight.bold),),
        Icon(Icons.search,color: light_blue,),

      ],
    ),
  );
}

class ItemData {
  ItemData(this.title, this.key);

  final String title;

  // Each item in reorderable list needs stable and unique key
  final Key key;
}

enum DraggingMode {
  iOS,
  android,
}