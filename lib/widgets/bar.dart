import 'dart:convert';

import 'package:expense_tracker/module/expense.dart';
import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  Bar({super.key,required this.height,required this.icon});
 final double height;
 late var myHeight=(height/10);
 final IconData icon;


  @override
  Widget build(BuildContext context) {
    if(myHeight>150){
      myHeight=150;
    }
     bool isDrak=Theme.of(context).brightness==Brightness.dark;
    final darkColor=Theme.of(context).colorScheme.onPrimaryContainer;
    final lightColor=Theme.of(context).colorScheme.onPrimaryContainer;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: myHeight,
          width: 70,
          decoration: BoxDecoration(
            color: isDrak?darkColor:lightColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight:Radius.circular(5) ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Icon(icon),
      ],
    );
  }
}
