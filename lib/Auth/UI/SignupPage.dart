import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/LoginPage.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/BottomRow.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomTextfield.dart';

class SignupPage extends StatelessWidget {
  static final routeName = 'signUp';

  SignupPage();

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
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 15.h),
                  child: Center(
                      child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30.sp),
                  ))),
              Center(
                  child: CustomText(
                      text: 'Add your details to sign up', verticall: 5.h)),
              SizedBox(
                height: 20.h,
              ),
              CustomTextField(
                label: 'Name',
                textEditingController: provider.nameController,
              ),
              CustomTextField(
                label: 'Email',
                textEditingController: provider.emailController,
              ),
              CustomTextField(
                label: 'Mobil No',
                textInputType: TextInputType.phone,
                textEditingController: provider.mobileNoController,
              ),
              CustomTextField(
                label: 'Address',
                textEditingController: provider.addressController,
              ),
              CustomTextField(
                label: 'Password',
                obscure: true,
                textEditingController: provider.passwordController,
              ),
              CustomTextField(
                label: 'Confirm Password',
                obscure: true,
                textEditingController: provider.confirmController,
              ),
              CustomButton(
                text: 'Sign Up',
                textcolor: Colors.white,
                fill: Color(0xfffc6011),
                function: () {
                  provider.register();
                },
              ),
              BottomRow(function:() {
                AppRouter.appRouter
                    .gotoPagewithReplacment(LoginPage.routeName);
              },title:'Already have an Account?' ,bottonString: 'Login ',)
            ],
          ),
        ),
      ),
    );
  }
}
