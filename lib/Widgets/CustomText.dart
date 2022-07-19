import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyText extends StatelessWidget {
  String text;
  double verticall;
   MyText({this.text,this.verticall});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: verticall.h),
        child: Text(text,style: TextStyle(color: Colors.grey),));
  }
}
