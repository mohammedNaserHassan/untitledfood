import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';
import 'package:untitledfood/Widgets/CustomText.dart';
import 'package:untitledfood/Widgets/CustomTextfield.dart';

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
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Center(
                    child: Text(
                  'Reset Password',
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
