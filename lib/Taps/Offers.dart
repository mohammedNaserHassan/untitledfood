import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/API/URLLauncher.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/AuthComponents/CustomButton.dart';

class OffersTab extends StatelessWidget {
  OffersTab();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) =>
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30.w, bottom: 30.h),
                      child: Text(
                        'Find discounts , offer special',
                        style: TextStyle(color: Colors.grey),
                      )),
                  Container(
                      height: 55.h,
                      width: 255.w,
                      child: CustomButton(
                        text: 'Check Offers',
                        textcolor: Colors.white,
                        fill: Color(0xfffc6011),
                      )),
                  provider.filteredPrducts == null
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: provider.filteredPrducts.length,
                    itemBuilder: (context, index) =>
                        GestureDetector(
                          onTap: () async {
                            Url_lancher_helper.url.openWebpage(provider.filteredPrducts[index].strYoutube);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                child: CachedNetworkImage(
                                  imageUrl: provider.filteredPrducts[index]
                                      .strMealThumb,
                                ),
                              ),
                              Text(
                                provider.filteredPrducts[index].strMeal,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(provider.filteredPrducts[index].strCategory),
                            ],
                          ),
                        ),
                  ),
                  SizedBox(height: 85.h,),
                ],
              ),
            ),
          ),
    );
  }
}
