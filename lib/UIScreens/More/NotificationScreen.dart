import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class NotificationScreen extends StatelessWidget {
  NotificationScreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context,provider,c)=>Visibility(
        visible: provider.states[2],
        child: Column(
          children: [
            ListTile(title: Text('Notifications'),leading: IconButton(
                onPressed: (){provider.changeStates(2);},
                icon: Icon(Icons.arrow_back_ios)),),
            SizedBox(
              height: 600.h,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context,index){
                  return Container(
                    color: index%2==0?Colors.white:Colors.grey.withOpacity(0.3),
                    child: ListTile(
                      title: Text('Your Order has been picked up'),
                      subtitle: Text('${index+2}Sep 2020',style: TextStyle(color: Colors.grey),),
                      leading: CircleAvatar(backgroundColor: Colors.deepOrange,radius: 5.sp,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
