import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/BottomSheet.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Visibility(
        visible: provider.states[0],
        child: Column(
          children: [
            ListTile(
              title: Text('Payment Details'),
              leading: IconButton(
                  onPressed: () {
                    provider.changeStates(0);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            Container(
              margin: EdgeInsets.only(right: 100, top: 10, bottom: 10),
              child: Text(
                'Customize your payment method',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration:
                  BoxDecoration(color: Colors.grey.shade100, boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 4),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ]),
              child: Column(
                children: [
                  ListTile(
                    trailing: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.check,
                          color: Colors.deepOrange,
                          size: 30,
                        )),
                    title: Text(
                      'Cash/Card on delivery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 40),
                          child: Text('VISA',style: TextStyle(color: Color(0xff00008b),fontWeight: FontWeight.bold,fontSize: 30),)),
                      Text('****\t\t****\t\t\t\t\t\t 2187'),
                      Container(
                          width: 155,
                          height: 55,
                          child: CustomButton(
                            borderColor: Color(0xfffc6011),
                            fill: Color.fromARGB(0, 0, 0, 1),
                            textcolor: Color(0xfffc6011),
                            text: 'Delete Card',
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 250),
                      child: Text(
                        'Other Methods',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return BottomSheetW();
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Color(0xfffc6011)),
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Add Another Credit/Debit Card',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
