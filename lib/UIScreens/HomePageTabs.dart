import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/AuthProvider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Services/Constants.dart';

import '../Widgets/GeneralComponents/CardIcon.dart';
class HomePageTabs extends StatefulWidget {
  static final routeName = 'HomePage';
  const HomePageTabs();

  @override
  State<HomePageTabs> createState() => _HomePageTabsState();
}

class _HomePageTabsState extends State<HomePageTabs> {
  bool keyboardOpen = false;
  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: ( visible) {
        setState(() {
          keyboardOpen=visible;
        });
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer2<MyProvider,AuthProvider>(
      builder: (context,provider,auth,index) {
        return Scaffold(
          resizeToAvoidBottomInset:false,
          appBar: AppBar(
            actions: [
              CardIcon(
                color: Colors.black,
                function: () {
                },
              )
            ],
            elevation: 0,
            title: Text(
              provider.selectedIndex == 2
                  ? '${provider.titleScaffod}  ${auth.user.name}'
                  : provider.titleScaffod,
              style: TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: Colors.white,
          ),
          body: Stack(
            children: [
             provider.taps[provider.selectedIndex],
            keyboardOpen? SizedBox(height: 0.h,): Positioned(
                bottom: -15.h,
                left: 0.w,
                right: 0.h,
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 20.r,
                                blurRadius: 30.r,
                                offset:  Offset(0.w, 15.h)
                            )
                          ]
                        ),
                        child: Image.asset('Assets/Images/bottomNavigationShape.png',width: widthDevice,fit: BoxFit.fill,)),
                    GestureDetector(
                      onTap: (){
                        provider.onChangeTab(2);
                      },
                      child: Center(
                        heightFactor: 0.4.sp,
                        child: SvgPicture.asset(provider.selectedIndex==2?'Assets/Images/5filled.svg':'Assets/Images/3.svg',width: 75.w),
                      ),
                    ),
                    Container(
                      width: widthDevice.w,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon:SvgPicture.asset('Assets/Images/1.svg',color: provider.selectedIndex==0?Colors.deepOrangeAccent:Colors.grey),
                            onPressed: () {
                              provider.onChangeTab(0);
                            },
                            splashColor: Colors.white,
                          ),
                          IconButton(
                              icon: SvgPicture.asset('Assets/Images/2.svg',color: provider.selectedIndex==1?Colors.deepOrangeAccent:Colors.grey),
                              onPressed: () {
                                provider.onChangeTab(1);
                              }),
                          Container(
                            width: widthDevice * 0.20.w,
                          ),
                          IconButton(
                              icon: SvgPicture.asset('Assets/Images/4.svg',color: provider.selectedIndex==3?Colors.deepOrangeAccent:Colors.grey,),
                              onPressed: () {
                                provider.onChangeTab(3);
                              }),
                          IconButton(
                              icon: SvgPicture.asset('Assets/Images/5.svg',color: provider.selectedIndex==4?Colors.deepOrangeAccent:Colors.grey,),
                              onPressed: () {
                                provider.onChangeTab(4);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}