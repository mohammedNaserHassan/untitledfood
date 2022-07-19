import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextField extends StatelessWidget {
  String label;
  TextInputType textInputType;
  bool obscure;
  TextEditingController textEditingController;
   CustomTextField({this.label,this.textInputType=TextInputType.text,this.obscure=false,this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(80.sp),
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
            hintText: label,
            contentPadding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 20.w),
            border: InputBorder.none
        ),
      ),
    );
  }
}
