import 'package:flutter/material.dart';
class CustomTile extends StatelessWidget {
  String text;
  Function function;
  CustomTile({this.text,this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Popular Restaurants'),
      trailing: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: Colors.deepOrangeAccent),
        ),
      ),
    );
  }
}
