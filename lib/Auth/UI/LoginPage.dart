import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/ResetPassword.dart';
import 'package:untitledfood/Auth/UI/SignupPage.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/UIScreens/HomePage.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';
import 'package:untitledfood/Widgets/CustomText.dart';
import 'package:untitledfood/Widgets/CustomTextfield.dart';

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
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30),
                  ))),
              Center(
                  child:
                      MyText(text: 'Add your details to login', verticall: 5)),
              SizedBox(
                height: 20,
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
                  child: MyText(text: 'Forget password?', verticall: 20)),
              MyText(text: 'or Login with', verticall: 20),
              TextButton(
                  onPressed: () async{
                    provider.handleLogin().then((value) =>
                    provider.isSignIn?
                        AppRouter.appRouter.gotoPagewithReplacment(HomePage.routeName):
                    null
                    );

                  },
                  child: Image.asset('Assets/Images/facebook.png')),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () async{
                    await provider.signInWithGoogle();

                  },
                  child: Image.asset('Assets/Images/google.png')),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(text: 'Don\'t have an Account?', verticall: 10),
                  TextButton(
                      onPressed: () {
                        AppRouter.appRouter
                            .gotoPagewithReplacment(SignupPage.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
