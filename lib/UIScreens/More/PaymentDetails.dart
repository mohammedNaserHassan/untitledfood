import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/GeneralComponents/BottomSheet.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Visibility(
        visible: provider.states[0],
        child: Column(
          children: [
            ListTile(
              title: Text('Payment Details'),
              leading: IconButton(
                  onPressed: () {
                    provider.changeStates(0);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            Container(
              margin: EdgeInsets.only(right: 100.w, top: 10.h, bottom: 10.h),
              child: Text(
                'Customize your payment method',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200.h,
              decoration:
                  BoxDecoration(color: Colors.grey.shade100, boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ]),
              child: Column(
                children: [
                  ListTile(
                    trailing: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        child: Icon(
                          Icons.check,
                          color: Colors.deepOrange,
                          size: 30.sp,
                        )),
                    title: Text(
                      'Cash/Card on delivery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 40.w),
                          child: Text('VISA',style: TextStyle(color: Color(0xff00008b),fontWeight: FontWeight.bold,fontSize: 30.sp),)),
                      Text('****\t\t****\t\t\t\t\t\t 2187'),
                      Container(
                          width: 155.w,
                          height: 55.h,
                          child: CustomButton(
                            borderColor: Color(0xfffc6011),
                            fill: Color.fromARGB(0, 0, 0, 1),
                            textcolor: Color(0xfffc6011),
                            text: 'Delete Card',
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 250.w),
                      child: Text(
                        'Other Methods',
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)
                      )
                    ),
                    builder: (context) {
                      return BottomSheetW();
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.sp),
                    color: Color(0xfffc6011)),
                width: double.infinity,
                height: 50.h,
                margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Add Another Credit/Debit Card',
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
