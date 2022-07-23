import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyText extends StatelessWidget {
  String text;
  double verticall;
  double horizontal;
   MyText({this.text,this.verticall,this.horizontal=0});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: verticall.h,horizontal: horizontal),
        child: Text(text,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,));
  }
}
