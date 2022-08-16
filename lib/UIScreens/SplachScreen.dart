import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';

class SplachScreen extends StatefulWidget {
  static final routeName='splach';
   SplachScreen();

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyProvider>(context, listen: false).getAllCategories();
    Provider.of<MyProvider>(context, listen: false).getMealByFirstLetter('l');
    Provider.of<MyProvider>(context, listen: false).getMealByFirstLetters('e');
    Provider.of<MyProvider>(context, listen: false).onChangeTab(2);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Provider.of<AuthProvider>(context,listen: false).checkLogin());
    return SafeArea(
        child: Image.asset(
      'Assets/Images/1.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ));
  }
}
