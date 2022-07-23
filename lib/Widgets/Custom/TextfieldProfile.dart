import 'package:flutter/material.dart';
class TextfieldProfile extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool enabled;
   TextfieldProfile({this.controller,this.label,this.enabled=true});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(80),
      ),
      child: TextField(
        enabled: enabled,
        controller: controller,
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
