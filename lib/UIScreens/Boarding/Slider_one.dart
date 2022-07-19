import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';

import 'Slider_two.dart';
class Slider_one extends StatelessWidget {
  static final routeName='one';
  const Slider_one();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset('Assets/Images/3.png'),
          CustomButton(text: 'Next',function: (){
            AppRouter.appRouter.goWithAnimation(Slider_two());
          },
            textcolor: Colors.white,
            fill: Color(0xfffc6011),
          )
        ],
      ),
    );
  }
}
