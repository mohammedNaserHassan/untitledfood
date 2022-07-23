import 'package:flutter/material.dart';
class CardIcon extends StatelessWidget {
  Color color;
  Function function;
   CardIcon({this.color,this.function});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed:    function,
        icon: Icon(
          Icons.shopping_cart,
          color: color,
        ));
  }
}
