import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/NewPassword.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/BottomRow.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';

import 'LoginPage.dart';

class CodeMobile extends StatefulWidget {
  static final routeName = 'PhoneCode';

  CodeMobile();

  @override
  State<CodeMobile> createState() => _CodeMobileState();
}

class _CodeMobileState extends State<CodeMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, c) => SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Container(
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          'We have  sent an OTP to your Mobile',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30.sp),
                        ))),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 30.w),
                    child: CustomText(
                      text:
                          'Please check your mobile number 059*****20  continue to reset your password',
                      verticall: 5.h,
                    )),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Pinput(
                      focusNode: provider.pinPutFocusNode,
                      controller: provider.pinPutController,
                      // submittedFieldDecoration: provider.pinPutDecoration,
                      // selectedFieldDecoration: provider.pinPutDecoration,
                      // followingFieldDecoration: provider.pinPutDecoration,

                      pinAnimationType: PinAnimationType.fade,
                      onSubmitted: (pin) async {
                        try {
                          provider.sendPin(pin);
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          provider.scaffoldkey.currentState.showSnackBar(
                              SnackBar(content: Text('invalid OTP')));
                        }
                      },
                    )),
                CustomButton(
                  function: () {
                    AppRouter.appRouter
                        .gotoPagewithReplacment(NewPassword.routeName);
                  },
                  text: 'Next',
                  textcolor: Colors.white,
                  fill: Color(0xfffc6011),
                ),
                BottomRow(
                  bottonString: 'Click Here ',
                  function: () {
                    AppRouter.appRouter
                        .gotoPagewithReplacment(LoginPage.routeName);
                  },
                  title: 'Didn\'nt Receive',
                )
              ])),
        ));
  }

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).verifyPhone();
  }
}
