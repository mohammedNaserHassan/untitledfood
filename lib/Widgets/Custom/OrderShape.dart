import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';

class orderShape extends StatelessWidget {
  const orderShape({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, prog) => ListTile(
        title: Container(
          margin: EdgeInsets.only(bottom: 2.h),
          child: Text(provider.filteredPrductss[2].strMeal,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        ),
        leading: Container(
            width: 80.w,
            height: 120.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
            child: Image.asset(
              'Assets/Images/food.png',
              fit: BoxFit.fill,
            )),
        subtitle: Column(
          children: [
            Row(
              children: [
                Text(
                  provider.filteredPrducts[3].strCategory,
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 3.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepOrange),
                ),
                Text(
                  'Western food',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.deepOrange,
                ),
                Text(
                  '4.9',
                  style: TextStyle(color: Colors.deepOrange),
                ),
                Text(
                  '(124 ratings)',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
