import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/GeneralComponents/CardIcon.dart';
import 'package:untitledfood/Widgets/GeneralComponents/myDropDown.dart';
import 'package:untitledfood/Widgets/Custom/customIconDetails.dart';

import '../Widgets/Custom/Ingredient.dart';

class MealDetails extends StatefulWidget {
  static final routeName = 'Details';
  String id;
  String tag;

  MealDetails({this.id, this.tag});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyProvider>(context, listen: false)
        .getSpecificProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Consumer<MyProvider>(
          builder: (context, provider, v) => provider.selectedProduct == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Container(
                      child: Hero(
                        tag: widget.tag,
                        child: CachedNetworkImage(
                          imageUrl: provider.selectedProduct.strMealThumb,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40.h,
                        left: 20.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Positioned(
                        top: 40.h,
                        right: 20.w,
                        child: CardIcon(
                          color: Colors.white,
                          function: () {
                            provider.setShopping(true);
                          },
                        )),
                    Positioned(
                        top: 370.h,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.sp),
                                topLeft: Radius.circular(40.sp),
                              )),
                          width: MediaQuery.of(context).size.width,
                          height: 500.h,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 30.h, left: 20.w),
                                    child: Text(
                                      provider.selectedProduct.strMeal,
                                      style: TextStyle(fontSize: 22.sp),
                                    )),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 10.h, left: 280.w),
                                  child: Text(
                                    'RS.' + '\t' + '200',
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '/\tper Portion',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey),
                                  ),
                                  margin: EdgeInsets.only(left: 310.w),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 10.h, left: 20.w),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 30.h, left: 20.w),
                                    child: Text(
                                      provider.selectedProduct.strInstructions
                                              .substring(0, 280) +
                                          '.',
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                    )),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: 10.h,
                                      left: 20.w,
                                    ),
                                    child: Text(
                                      'Ingredient',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Ingredient(provider.selectedProduct),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 30.w),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(5.sp)),
                                    child: MyDropDown(
                                      hint: '-Select the size of portion-',
                                      t1: "Small",
                                      t2: "Medium",
                                      t3: "Large",
                                    )),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Number of Portions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp),
                                      ),
                                      CustomIconDetails(
                                        function: provider.decrement(),
                                        iconData: Icons.remove,
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text(
                                          provider.value.toString(),
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        )),
                                        width: 60.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.sp),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.deepOrange)),
                                      ),
                                      CustomIconDetails(
                                        function: provider.increment(),
                                        iconData: Icons.add,
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 120.w,
                                          height: 180.h,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(80.sp),
                                                topRight:
                                                    Radius.circular(80.sp),
                                                topLeft: Radius.circular(15.sp),
                                                bottomLeft:
                                                    Radius.circular(15.sp),
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 40.h, horizontal: 40.w),
                                          width: 300.w,
                                          height: 100.h,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Total Price'),
                                              Text(
                                                'LKR' + '\t' + '200',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.sp),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.white,
                                                      size: 10.sp,
                                                    ),
                                                    Text(
                                                      'Add toCart',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                                width: 100.w,
                                                height: 30.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.sp)),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2.0,
                                                  spreadRadius: 0.0,
                                                  offset: Offset(2.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15.sp),
                                                topRight:
                                                    Radius.circular(15.sp),
                                                topLeft: Radius.circular(40.sp),
                                                bottomLeft:
                                                    Radius.circular(40.sp),
                                              )),
                                        ),
                                        Positioned(
                                          right: 20.w,
                                          top: 70.h,
                                          child: Container(
                                            width: 45.w,
                                            height: 45.h,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 2.0,
                                                    spreadRadius: 0.0,
                                                    offset: Offset(2.0, 2.0),
                                                  )
                                                ],
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.deepOrangeAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50.h,
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 350.h,
                        right: 20.w,
                        child: Transform.rotate(
                          angle: 120,
                          child: Card(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_sharp,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
    );
  }
}
