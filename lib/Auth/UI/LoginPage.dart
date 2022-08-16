import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/ResetPassword.dart';
import 'package:untitledfood/Auth/UI/SignupPage.dart';
import 'package:untitledfood/UIScreens/HomePageTabs.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomTextfield.dart';

import '../../Widgets/AuthComponents/BottomRow.dart';

class LoginPage extends StatelessWidget {
  static final routeName = 'Login';

  LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, m) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30.sp),
                  ))),
              Center(
                  child:
                      CustomText(text: 'Add your details to login', verticall: 5.h)),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                label: 'Your Email',
                textEditingController: provider.emailController,
              ),
              CustomTextField(
                label: 'Password',
                obscure: true,
                textEditingController: provider.passwordController,
              ),
              CustomButton(
                text: 'Login',
                textcolor: Colors.white,
                fill: Color(0xfffc6011),
                function: () {
                  provider.login();
                },
              ),
              TextButton(
                  onPressed: () {
                    AppRouter.appRouter
                        .gotoPagewithReplacment(ResetPassword.routeName);
                  },
                  child: CustomText(text: 'Forget password?', verticall: 20.h)),
              CustomText(text: 'or Login with', verticall: 20.h),
              TextButton(
                  onPressed: () async{
                    provider.handleLogin().then((value) =>
                    provider.isSignIn?
                        AppRouter.appRouter.gotoPagewithReplacment(HomePageTabs.routeName):
                    null
                    );

                  },
                  child: Image.asset('Assets/Images/facebook.png')),
              SizedBox(
                height: 10.h,
              ),
              TextButton(
                  onPressed: () async{
                    await provider.signInWithGoogle();

                  },
                  child: Image.asset('Assets/Images/google.png')),
              SizedBox(
                height: 80.h,
              ),
              BottomRow(title: 'Don\'t have an Account?',bottonString:  'Sign Up',function: () {
                AppRouter.appRouter
                    .gotoPagewithReplacment(SignupPage.routeName);},)
            ],
          ),
        ),
      ),
    );
  }
}

