import 'package:flutter/material.dart';
class SearchWidget extends StatelessWidget {
  String label;
   SearchWidget({this.label});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.search,
                size: 25,
                color: Colors.black45,
              )),
          Expanded(
            child: TextField(
              autocorrect: true,
              decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none),
            ),
          )
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        color: Color(0xffb6b7b7).withOpacity(0.3),
      ),
    );
  }
}
