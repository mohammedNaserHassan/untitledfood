import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/UIScreens/Slider_three.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';
class Slider_two extends StatelessWidget {
  static final routeName='two';
   Slider_two();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset('Assets/Images/4.png'),
          CustomButton(text: 'Next',function: (){
            AppRouter.appRouter.goWithAnimation(Slider_three());
          },
            textcolor: Colors.white,
            fill: Color(0xfffc6011),
          )
        ],
      ),
    );
  }
}
