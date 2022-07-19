import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  String text;
  Color textcolor,fill;
  Function function;
  Color borderColor;
   CustomButton({this.text,this.textcolor,this.fill,this.function,this.borderColor=const Color(0xfffc6011)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(80.sp),
          border: Border.all(color: borderColor)
      ),
      child: TextButton(
        onPressed: function,
        child: Text(text,style: TextStyle(color: textcolor),),
      ),
    );
  }
}
