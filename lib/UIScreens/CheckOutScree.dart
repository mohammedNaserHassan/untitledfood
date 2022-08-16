import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';

import '../Widgets/AuthComponents/CustomButton.dart';



class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            AppRouter.appRouter.back();
          },
        ),
      ),
      body: Consumer<MyProvider>(
        builder:(context,provider,index)=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Delivery Address',horizontal: 20,verticall:20,),
           Container(
             child:  Text('653 Nostrand Ave.,',style: TextStyle(fontWeight: FontWeight.bold),),
             margin: EdgeInsets.only(left: 20),
           ),
            ListTile(
              title: Text('Brooklyn, NY 11216',style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text('Change',style: TextStyle(color: Colors.deepOrange)),
            ),
            Container(
              height: 10,
              color: Colors.grey.withOpacity(0.5),
            ),
            ListTile(
              title: Text('Payment method',style: TextStyle(color: Colors.grey),),
              trailing: Text('+  Add Card',style: TextStyle(color: Colors.deepOrange)),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
                itemBuilder: (con, index) => Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3)
                  ),
                  child: ListTile(
                    title: Text('Cash on delivery'),
                    trailing:  Radio(
                      activeColor: Colors.deepOrange,
                      fillColor:
                      MaterialStateColor.resolveWith((states) => Colors.deepOrange),
                      value: Payment.values[index],
                      groupValue:provider.payment ,
                      onChanged: ( value) {
                        provider.setPayment(value);
                      },
                    ),
                  ),
                )),
            SizedBox(height: 20,),
            Container(
              height: 10,
              color: Colors.grey.withOpacity(0.5),
            ),
            checkoutTile(),
            checkoutTile(),
            checkoutTile(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            checkoutTile(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 10,
              color: Colors.grey.withOpacity(0.5),
            ),
            CustomButton(
              function: () {

              },
              text: 'Send Order',
              textcolor: Colors.white,
              fill: Color(0xfffc6011),
            ),
          ],
        ),
      ),
    );
  }
}

class checkoutTile extends StatelessWidget {
  const checkoutTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: ListTile(title: Text('Sub Total'),
      trailing: Text('\$ 22',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
