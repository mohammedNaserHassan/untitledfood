import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';

import '../../Widgets/Custom/ListtTlePayment.dart';
import '../../Widgets/Custom/OrderShape.dart';
import '../CheckOutScree.dart';
class MyOrdeer extends StatelessWidget {
  const MyOrdeer();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
        builder: (context,provider,c)=>Visibility(
            visible: provider.states[1],
            child: SingleChildScrollView(
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
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: orderShape()),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context,index)=>Column(
                      children: [
                        Container(
                          color: Colors.grey.withOpacity(0.5),
                          child: ListTile(
                            trailing: Text('\$1${index}',style: TextStyle(fontWeight: FontWeight.bold)),
                            title: Text('Beef Burger x ${index}',style: TextStyle(fontWeight: FontWeight.normal)),
                          ),

                        ),
                        Container(
                          height: 0,
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListtTlePayment(title: 'Delivery Instrusctions',trailing: '+   Add Notes',weight: false),
                  ListtTlePayment(title: 'Sub Total',trailing: '\$68',visible: false),
                  ListtTlePayment(title: 'Delivery Cost',trailing: '\$2',),
                  ListtTlePayment(title: 'Total',trailing: '\$70',note: true),
                  CustomButton(
                    function: () {
                      AppRouter.appRouter.goesWithInternalAnimation(CheckOutScreen());
                    },
                    text: 'Checkout',
                    textcolor: Colors.white,
                    fill: Color(0xfffc6011),
                  ),
                  SizedBox(height: 100,)
                ],
              ),
            )));
  }
}
