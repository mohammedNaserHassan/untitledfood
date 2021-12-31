import 'package:flutter/material.dart';
class MyText extends StatelessWidget {
  String text;
  double verticall;
   MyText({this.text,this.verticall});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: verticall),
        child: Text(text,style: TextStyle(color: Colors.grey),));
  }
}
