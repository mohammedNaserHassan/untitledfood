import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomIconDetails extends StatelessWidget {
   CustomIconDetails({this.function,this.iconData});
   IconData iconData;
   Function function;

  @override
  Widget build(BuildContext context) {
    return    Container(
      child: IconButton(
          onPressed: function,
          icon: Icon(
           iconData,
            color: Colors.white,
            size: 12.sp,
          )),
      width: 60.w,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(30.sp),
          color: Colors.deepOrangeAccent),
    );
  }
}
