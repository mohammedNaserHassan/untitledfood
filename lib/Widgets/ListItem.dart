import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/API/URLLauncher.dart';
import 'package:untitledfood/Providers/MyProvider.dart';

class ListItem extends StatelessWidget {
  Axis axisDirection;
  ListItem({this.axisDirection});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (contexy, provider, v) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.71,
        child: provider.filteredPrducts == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
          scrollDirection:axisDirection,
                itemCount: provider.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Url_lancher_helper.url.openWebpage(
                        provider.filteredPrducts[index]['strYoutube']);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        child: CachedNetworkImage(
                          imageUrl: provider.filteredPrducts[index]
                              ['strMealThumb'],
                        ),
                      ),
                      Text(
                        provider.filteredPrducts[index]['strMeal'],
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                          Text(
                            '4.9',
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          Text(
                            '(124 ratings)',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            provider.filteredPrducts[index]['strCategory'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            width: 3.w,
                            height: 3.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange),
                          ),
                          Text(
                            'Western food',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
