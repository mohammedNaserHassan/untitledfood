import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/API/URLLauncher.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/ListItem.dart';
import 'package:untitledfood/Widgets/SearchWidget.dart';
import 'package:untitledfood/Widgets/myDropDown.dart';

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
              Container(
                  margin: EdgeInsets.only(left: 20.w, top: 20.h),
                  child: Text(
                    'Delivering to',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  )),
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
              ListTile(
                title: Text('Popular Restaurants'),
                trailing: TextButton(
                  onPressed: () {
                    provider.setLength(12);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
              provider.allCategories == null
                  ? CircularProgressIndicator()
                  : ListItem(
                      axisDirection: Axis.vertical,
                    ),
              ListTile(
                title: Text('Most Popular'),
                trailing: TextButton(
                  onPressed: () {
                    provider.setLengthD(10);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
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
                                    .filteredPrductss[index]['strYoutube']);
                              },
                              child: SizedBox(
                                width: 320.w,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            provider.filteredPrductss[index]
                                                ['strMealThumb'],
                                        fit: BoxFit.cover,
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 15.w),
                                      width: 200.w,
                                      height: 140.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15.sp)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15.w),
                                      child: Text(
                                        provider.filteredPrducts[index]
                                            ['strMeal'],
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
                                                ['strCategory'],
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
              ListTile(
                title: Text('Recent Items'),
                trailing: TextButton(
                  onPressed: () {
                    provider.setLengthC(8);
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
