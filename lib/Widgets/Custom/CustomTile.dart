import 'package:flutter/material.dart';
class CustomTile extends StatelessWidget {
  String text,mainText;
  Function function;
  CustomTile({this.text,this.function,this.mainText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mainText),
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
