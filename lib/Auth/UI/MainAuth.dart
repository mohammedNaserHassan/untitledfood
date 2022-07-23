import 'package:flutter/material.dart';
import 'package:untitledfood/Auth/UI/LoginPage.dart';
import 'package:untitledfood/Auth/UI/SignupPage.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';

class MainAuth extends StatelessWidget {
  static final routeName = 'Auth';

  MainAuth();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            'Assets/Images/2.png',
            width: double.infinity,
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            function: (){
              AppRouter.appRouter.gotoPagewithReplacment(LoginPage.routeName);
            },
            text: 'Login',
            fill: Color(0xfffc6011),
            textcolor: Colors.white,
          ),
          CustomButton(
            function: (){
              AppRouter.appRouter.gotoPagewithReplacment(SignupPage.routeName);
            },
            text: 'Create an Account',
            fill: Colors.white,
            textcolor: Color(0xfffc6011),
          ),
        ],
      ),
    );
  }
}
