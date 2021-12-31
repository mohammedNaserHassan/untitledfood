import 'package:flutter/material.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/UIScreens/HomePage.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';

class Slider_three extends StatelessWidget {
  static final routeName='three';
   Slider_three();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset('Assets/Images/5.png'),
          CustomButton(text: 'Next',function: (){
            AppRouter.appRouter.gotoPagewithReplacment(HomePage.routeName);
          },
            textcolor: Colors.white,
            fill: Color(0xfffc6011),
          )
        ],
      ),
    );
  }
}
