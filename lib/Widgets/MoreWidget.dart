import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class MoreWidget extends StatelessWidget {
  String title;
  IconData icon;
  bool state;
  int number;
  MoreWidget({this.title,this.icon,this.state=false,this.number});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context,provider,v)=>GestureDetector(
      onTap: (){
        provider.changeStates(number);
      },
      child: Visibility(
          visible: provider.stateofWidgets,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20,right: 30,bottom: 20),
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
title: Text(title),
                  leading: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: Icon(icon,color: Colors.black,),
                    ),
                  ),
                  trailing: Visibility(
                    visible: state,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,child: Text('15',style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade100,
                  child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
