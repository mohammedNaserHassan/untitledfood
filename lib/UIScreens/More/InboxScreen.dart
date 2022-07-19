import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
class InboxSecreen extends StatelessWidget {
   InboxSecreen();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context,provider,c)=>Visibility(
        visible: provider.states[3],
        child: Column(
          children: [
            ListTile(title: Text('Inbox'),leading: IconButton(
                onPressed: (){provider.changeStates(3);},
                icon: Icon(Icons.arrow_back_ios)),),
            SizedBox(
              height: 600.h,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context,index){
                  return Container(
                    color: index%2==0?Colors.white:Colors.grey.withOpacity(0.3),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('MealMonkey Promotions'),
                          subtitle: Text('Lorem ipsum dolor sit',style: TextStyle(color: Colors.grey),),
                          leading: CircleAvatar(backgroundColor: Colors.deepOrange,radius: 5.sp,),
                          trailing: Text('${index+1}th July',style: TextStyle(color: Colors.grey),),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h),
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.star_border_outlined,color: Colors.deepOrange,))
                      ],
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
