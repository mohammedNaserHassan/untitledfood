import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/API/URLLauncher.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomText.dart';
import 'package:untitledfood/Widgets/Custom/ListItem.dart';
import 'package:untitledfood/Widgets/GeneralComponents/SearchWidget.dart';
import 'package:untitledfood/Widgets/GeneralComponents/myDropDown.dart';

import '../Widgets/Custom/CustomTile.dart';
import '../Widgets/Custom/OrderShape.dart';

class MainHome extends StatefulWidget {
  static final routeName = 'Main Home';

  const MainHome();

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<MyProvider>(
          builder: (context, provider, m) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Delivering to',
                verticall: 20,
                horizontal: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w),
                width: 200.w,
                child: MyDropDown(
                  hint: 'Current Location',
                  t1: 'Gaza',
                  t2: 'Dafa',
                  t3: 'Egypt',
                ),
              ),
              SearchWidget(
                label: 'Search food',
              ),
              Container(
                height: 113.h,
                margin: EdgeInsets.only(left: 10.w,top: 20.h,bottom:20.h),
                child: ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(width: 10.w,),
                  itemBuilder: (context,index)=>Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5.h),
                      height: 90.h,
                      width: 90.w,
                      decoration:BoxDecoration(
                        image: DecorationImage(image: AssetImage('Assets/Images/food.png'),fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(15.r)
                      ) ,
                    ),
                    Text('Offers')
                  ],
                ),itemCount: 5,scrollDirection: Axis.horizontal,),
              ),
              CustomTile(
                mainText: 'Popular Restaurants',
                  function:
                      provider.setLength(provider.filteredPrductss.length),
                  text: 'View All'),
              provider.allCategories == null
                  ? CircularProgressIndicator()
                  : ListItem(
                      axisDirection: Axis.vertical,
                    ),
              CustomTile(
                mainText: 'Most Popular',
                text: 'View all',
                function: provider.setLengthD(10),
              ),
              provider.filteredPrductss == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 220.h,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.lengthD,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Url_lancher_helper.url.openWebpage(provider
                                    .filteredPrductss[index].strYoutube);
                              },
                              child: SizedBox(
                                width: 270.w,
                                height: 150,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                    image: NetworkImage(
                                 provider
                                    .filteredPrductss[index]
                                  .strMealThumb,
                                ),
                                ),
                                          borderRadius:
                                          BorderRadius.circular(10.sp)),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 15.w),
                                      height: 150.h,
                                      width: 100,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15.w),
                                      child: Text(
                                        provider.filteredPrducts[index].strMeal,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            provider.filteredPrducts[index]
                                                .strCategory,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.w),
                                            width: 3.w,
                                            height: 3.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.deepOrange),
                                          ),
                                          Text(
                                            'Western food',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.deepOrange,
                                          ),
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                color: Colors.deepOrange),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))),
                    ),
              CustomTile(
                text: 'View all',
                mainText: 'Recent Items',
                function: provider.setLengthC(8),
              ),
          SizedBox(
            height: 300,
            child: ListView.separated(
              separatorBuilder: (context,index)=>SizedBox(height: 20,),
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,index)=>orderShape(),
              ),
            ),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
      ),
    );
  }
}

