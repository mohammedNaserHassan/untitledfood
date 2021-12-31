import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/NewPassword.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';
import 'package:untitledfood/Widgets/CustomText.dart';

import 'LoginPage.dart';
class CodeMobile extends StatefulWidget {
  static final routeName='PhoneCode';
   CodeMobile();

  @override
  State<CodeMobile> createState() => _CodeMobileState();
}

class _CodeMobileState extends State<CodeMobile> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(
          builder: (context,provider,c)=>SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'We have  sent an OTP to',
                              style: TextStyle(fontSize: 30),
                            ))),
                    Center(child: Text('your Mobile', style: TextStyle(fontSize: 30))),
                    SizedBox(height: 10,),
                    Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Please check your mobile number 071*****12',
                          style: TextStyle(color: Colors.grey),
                        )),
                    Text(' continue to reset your password',style:TextStyle(color: Colors.grey) ,),
                    SizedBox(
                      height: 20,
                    ),

    Padding(
    padding: const EdgeInsets.all(30.0),
    child: PinPut(
    fieldsCount: 6,
    textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
    eachFieldWidth: 50.0,
    eachFieldHeight: 50.0,
    focusNode: provider.pinPutFocusNode,
    controller: provider.pinPutController,
    submittedFieldDecoration: provider.pinPutDecoration,
    selectedFieldDecoration: provider.pinPutDecoration,
    followingFieldDecoration: provider.pinPutDecoration,
    pinAnimationType: PinAnimationType.fade,
      onSubmit: (pin) async {
          try {
          provider.sendPin(pin);
          } catch (e) {
            FocusScope.of(context).unfocus();
            _scaffoldkey.currentState
                .showSnackBar(SnackBar(content: Text('invalid OTP')));
          }
      },
    )),

                    CustomButton(
                      function: (){
                        AppRouter.appRouter.gotoPagewithReplacment(NewPassword.routeName);
                      },
                      text: 'Next',
                      textcolor: Colors.white,
                      fill: Color(0xfffc6011),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(text: 'Didn\'nt Receive',verticall: 10),
                        TextButton(onPressed: (){
                          AppRouter.appRouter.gotoPagewithReplacment(LoginPage.routeName);
                        }, child: Text('Click Here ',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),))
                      ],
                    )
                  ])
          ),
        )
   );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context,listen: false).verifyPhone();
  }
}
