import 'package:flutter/material.dart';
class  ListtTlePayment extends StatelessWidget {
  String title, trailing;
  bool visible ,note, weight;
    ListtTlePayment({this.trailing,this.title,this.visible=true,this.note=false,this.weight=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: visible?50:30,
          child: ListTile(
            title: Text(title,style: TextStyle(fontWeight: FontWeight.bold),),
            trailing: Text(trailing,style: TextStyle(color: Colors.deepOrange,fontSize: note?22:14,fontWeight: weight?FontWeight.bold:FontWeight.normal),),
          ),
        ),
    Visibility(
      visible: visible,
      child: Container(
      height: 0,
      child: Divider(
      color: Colors.grey,
      ),),
    )
      ],
    );
  }
}
