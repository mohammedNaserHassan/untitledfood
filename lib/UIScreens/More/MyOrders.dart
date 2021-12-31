import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class MyOrdeer extends StatelessWidget {
  const MyOrdeer();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
        builder: (context,provider,c)=>Visibility(
            visible: provider.states[1],
            child: Column(
              children: [
                ListTile(
                  title: Text('My Order'),
                  leading: IconButton(
                      onPressed: () {
                        provider.changeStates(1);
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                ),
              ],
            )));
  }
}
