import 'package:animated_card/animated_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/UIScreens/HomePageTabs.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/UIScreens/MealDetails.dart';
import 'package:untitledfood/Widgets/GeneralComponents/CardIcon.dart';
import 'package:untitledfood/Widgets/GeneralComponents/GoBack.dart';
import 'package:untitledfood/Widgets/GeneralComponents/SearchWidget.dart';

class MealsCategory extends StatefulWidget {
  static final routeName = 'MealsCat';
  String name;

  MealsCategory({this.name});

  @override
  State<MealsCategory> createState() => _MealsCategoryState();
}

class _MealsCategoryState extends State<MealsCategory> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyProvider>(context, listen: false)
        .getCategoryProducts(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
         CardIcon(color: Colors.black,)
        ],
        leading: GoBack(page: HomePageTabs.routeName,),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, v) => provider.categoryProducts == null
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SearchWidget(label: 'Search food'),
                    SizedBox(
                      height: 700.h,
                      child:
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.categoryProducts.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            AppRouter.appRouter.goesWithInternalAnimation(MealDetails(
                              tag: index.toString(),
                              id: provider.categoryProducts[index]
                              ['idMeal'],
                            ));
                          },

                          child: AnimatedCard(
                            direction: AnimatedCardDirection.right, //Initial animation direction
                            initDelay: Duration(milliseconds: 100), //Delay to initial animation
                            duration: Duration(seconds: 1), //Initial animation duration
                            onRemove: () => provider.categoryProducts.removeAt(index),
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Hero(
                                    tag: index.toString(),
                                    child: CachedNetworkImage(
                                      imageUrl: provider.categoryProducts[index]
                                          ['strMealThumb'],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10.h,
                                  left: 20.w,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          provider.categoryProducts[index]
                                              ['strMeal'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 5.w,
                                              height: 5.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle),
                                            ),
                                            Text(
                                              widget.name,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
