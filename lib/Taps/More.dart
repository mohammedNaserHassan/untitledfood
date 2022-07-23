import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/UIScreens/More/AboutScreen.dart';
import 'package:untitledfood/UIScreens/More/InboxScreen.dart';
import 'package:untitledfood/UIScreens/More/MyOrders.dart';
import 'package:untitledfood/UIScreens/More/NotificationScreen.dart';
import 'package:untitledfood/UIScreens/More/PaymentDetails.dart';
import 'package:untitledfood/Widgets/Custom/MoreWidget.dart';
class MoreTab extends StatelessWidget {
  const MoreTab();

  @override
  Widget build(BuildContext context) {
    return  Consumer<MyProvider>(
      builder:(context,provider,c)=> Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20.h,),
            MoreWidget(icon: Icons.monetization_on,title: 'Payment Details',number: 0,),
            MoreWidget(icon: Icons.shopping_bag,title: 'My Orders',number: 1,),
            MoreWidget(icon: Icons.notifications,title: 'Notifications',state: true,number: 2,),
            MoreWidget(icon: Icons.all_inbox,title: 'Inbox',number: 3,),
            MoreWidget(icon: Icons.info_outline_rounded,title: 'About Us',number: 4,),
            AboutScreen(),
            InboxSecreen(),
            NotificationScreen(),
            PaymentDetails(),
            MyOrdeer()
          ],
        ),

      ),
    );
  }
}
