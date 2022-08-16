import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomText.dart';
class BottomRow extends StatelessWidget {
  String title,bottonString;
  Function function;
  BottomRow({this.title,this.bottonString,this.function});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(text: title, verticall: 10.h),
        TextButton(
            onPressed: function,
            child: Text(
              bottonString,
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ))
      ],
    );
  }
}
