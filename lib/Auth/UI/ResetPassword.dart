import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomTextfield.dart';

class ResetPassword extends StatelessWidget {
  static final routeName = 'Password';

  const ResetPassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(
          builder: (context,provider,index)=>SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                child: Center(
                    child: Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 30.sp),
                ))),
                Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 74.w),
                child: CustomText(
                 text: 'Please enter your email to receive a link to create a new password via email',verticall: 10,),
                ),
                SizedBox(
              height: 20.h,
                ),
                CustomTextField(
textEditingController: provider.emailController,
              label: 'Email',
                ),
                CustomButton(
                  function: provider.resetPassword,
              text: 'Send',
              textcolor: Colors.white,
              fill: Color(0xfffc6011),
                ),
              ])),
        ));
  }
}
