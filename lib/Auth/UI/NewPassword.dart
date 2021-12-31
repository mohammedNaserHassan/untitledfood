import 'package:flutter/material.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/UIScreens/Slider_one.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';
import 'package:untitledfood/Widgets/CustomTextfield.dart';
class NewPassword extends StatelessWidget {
  static final routeName='NewPassword';
  const NewPassword();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Center(
                          child: Text(
                            'New Password',
                            style: TextStyle(fontSize: 30),
                          ))),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 74),
                      child: Text(
                        'Please enter your email to receive a link to create a new password via email',
                        style: TextStyle(color: Colors.grey),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    label: 'New Password',
                    obscure: true,
                  ),
                  CustomTextField(
                    label: 'Confirm Password',
                    obscure: true,
                  ),
                  CustomButton(
                    function: (){
                      AppRouter.appRouter.gotoPagewithReplacment(Slider_one.routeName);
                    },
                    text: 'Next',
                    textcolor: Colors.white,
                    fill: Color(0xfffc6011),
                  ),
                ])));
  }
}
