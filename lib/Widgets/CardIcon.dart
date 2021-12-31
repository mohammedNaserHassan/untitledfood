import 'package:flutter/material.dart';
class CardIcon extends StatelessWidget {
  Color color;
   CardIcon({this.color});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.shopping_cart,
          color: color,
        ));
  }
}
