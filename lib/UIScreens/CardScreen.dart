import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class  CardShopping extends StatelessWidget {
  const  CardShopping();
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder:(context,provider,index)=> Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height-50,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child:   IconButton(onPressed: (){
            },icon: Icon(Icons.arrow_back_ios)),
          ),
          ],
        ),
      ),
    );
  }
}
