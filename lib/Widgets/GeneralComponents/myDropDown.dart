import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class MyDropDown extends StatelessWidget {
  String hint;
  String t1,t2,t3;
   MyDropDown({this.hint,this.t1,this.t2,this.t3});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context,provider,m)=>DropdownButton<String>(
        iconEnabledColor: Colors.deepOrange,
        underline: Container(
          color: Colors.white,
        ),
        icon: Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        hint: Text(hint),
        value: provider.valueDrop,
        items: [
          DropdownMenuItem(
            child: Text(t1),
            value: '1',
          ),
          DropdownMenuItem(
            child: Text(t2),
            value: '2',
          ),
          DropdownMenuItem(
            child: Text(t3),
            value: '3',
          ),
        ],
        onChanged: (value) {
          provider.setValue(value);
        },
      ),
    );
  }
}
