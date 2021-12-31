import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  String label;
  TextInputType textInputType;
  bool obscure;
  TextEditingController textEditingController;
   CustomTextField({this.label,this.textInputType=TextInputType.text,this.obscure=false,this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(80),
      ),
      child: TextField(
        controller: textEditingController,
        obscureText: obscure,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
            hintText: label,
            contentPadding: EdgeInsets.all(20),
            border: InputBorder.none
        ),
      ),
    );
  }
}
