import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/UIScreens/MealsCategory.dart';
import 'package:untitledfood/Widgets/SearchWidget.dart';

class MenuTab extends StatelessWidget {
  MenuTab();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Container(
        color: Colors.white,
        child: Column(
          children: [
            SearchWidget(label: 'Search food'),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0.h,
                    bottom: 20.h,
                    left: 0.w,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      width: 100.w,
                      height: 570.h,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80.sp),
                            bottomRight: Radius.circular(80.sp),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    bottom: 20.h,
                    left: 10.w,
                    right: 10.w,
                    child: provider.allCategories == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: provider.allCategories.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) => MealsCategory(
                                              name:
                                                  provider.allCategories[index]
                                                      ['strCategory'],
                                            )));
                              },
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Positioned(
                                    child: Container(
                                      height: 80.h,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 40.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade100),
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(70.sp),
                                            topLeft: Radius.circular(70.sp),
                                            bottomRight: Radius.circular(15.sp),
                                            topRight: Radius.circular(15.sp),
                                          )),
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 15.h, left: 70.w),
                                        child: Text(
                                          provider.allCategories[index]
                                              ['strCategory'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0.w,
                                    top: 0.h,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(0, 0, 0, 1),
                                      radius: 50.sp,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: provider.allCategories[index]
                                            ['strCategoryThumb'],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0.h,
                                    bottom: 0.h,
                                    right: 20.w,
                                    child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.orange,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
