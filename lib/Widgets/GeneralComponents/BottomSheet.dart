import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Router.dart';

import '../AuthComponents/CustomTextfield.dart';
class BottomSheetW extends StatelessWidget {
  const BottomSheetW();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Consumer<MyProvider>(
        builder:(context,provider,v)=> Column(
          children: [
            ListTile(
              trailing: IconButton(icon: Icon(Icons.close,color: Colors.black,),onPressed: (){
                AppRouter.appRouter.back();
              },),
              title: Text(
                'Add Credit/Debit Card',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.w),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            CustomTextField(
              label: 'Card Number',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Expiry'),
                Container(
                  width: 170.w,
                  child: CustomTextField(
                    label: 'MM',
                  ),
                ),
                Container(
                  width: 170.w,
                  child: CustomTextField(
                    label: 'YY',
                  ),
                ),
              ],
            ),
            CustomTextField(
              label: 'Security Code',
            ),
            CustomTextField(
              label: 'First Name',
            ),
            CustomTextField(
              label: 'Last Name',
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Text(
                  'You can remove this card',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.only(left: 130.w),
                  child: Switch(
                    value: provider.valueSwitch,
                    onChanged: (val) {
                      provider.changeSwitch(val);
                    },
                    activeColor: Colors.deepOrange,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                AppRouter.appRouter.back();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.sp),
                    color: Color(0xfffc6011)),
                width: double.infinity,
                height: 50.h,
                margin: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.sp,
                    ),
                    Text(
                      'Add Card',
                      style: TextStyle(
                          color: Colors.white, fontSize: 20.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
