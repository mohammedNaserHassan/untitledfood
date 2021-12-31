import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:untitledfood/Services/Router.dart';
import 'package:untitledfood/Taps/MainHome.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.menu,
    Icons.lock,
    Icons.person,
    Icons.more_sharp,
  ];
  final textlist = <String>['Menu', 'Offers', 'Profile', 'More'];
  bool keyboardOpen = false;
  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() => keyboardOpen = visible);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, v) => Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
          elevation: 0,
          title: Text(
            provider.titleScaffod,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body:   provider.isFloating?MainHome():provider.taps[provider.selectedIndex],
        floatingActionButton: keyboardOpen
            ? SizedBox()
            :FloatingActionButton(
          elevation: 8,
          backgroundColor: provider.isFloating?Colors.deepOrangeAccent:Colors.grey,
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: ()async {
          provider.setFloating();
         provider.setSelectefIndex();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: AnimatedBottomNavigationBar.builder(
            itemCount: iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = provider.isFloating?Colors.grey:isActive ? Colors.deepOrangeAccent : Colors.grey;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    size: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '${textlist[index]}',
                      maxLines: 1,
                      style:
                          TextStyle(color: color, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              );
            },
            backgroundColor: Colors.white,
            activeIndex: provider.selectedIndex,
            splashColor: Color(0xffFFA400),
            notchAndCornersAnimation: animation,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            onTap: (index) => provider.onChangeTab(index),
          ),
        ),
      ),
    );
  }
}
