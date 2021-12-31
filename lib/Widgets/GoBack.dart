import 'package:flutter/material.dart';
import 'package:untitledfood/Services/Router.dart';
class GoBack extends StatelessWidget {
  String page;
  Color color;
   GoBack({this.page,this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          AppRouter.appRouter.gotoPagewithReplacment(page);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: color,
        ));
  }
}
