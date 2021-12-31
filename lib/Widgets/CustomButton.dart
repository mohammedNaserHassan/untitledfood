import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  String text;
  Color textcolor,fill;
  Function function;
  Color borderColor;
   CustomButton({this.text,this.textcolor,this.fill,this.function,this.borderColor=const Color(0xfffc6011)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: fill,
          borderRadius: BorderRadius.circular(80),
          border: Border.all(color: borderColor)
      ),
      child: TextButton(
        onPressed: function,
        child: Text(text,style: TextStyle(color: textcolor),),
      ),
    );
  }
}
