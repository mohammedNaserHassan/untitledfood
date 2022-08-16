import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
////////////Class to navigate between screen using key
class AppRouter {
  AppRouter._();

  static AppRouter appRouter = AppRouter._();
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();
////////////Go to page with replacement////////////////////////
  gotoPage(String routeName) {
    navkey.currentState.pushNamed(routeName);
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////Go to page without replacement with animation ////////////////////////////////////
  goWithAnimation(Widget widget) {
    navkey.currentState.pushReplacement(
      PageTransition(
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 800),
        curve: Curves.bounceOut,
        type: PageTransitionType.rightToLeftWithFade,
        child: widget,
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////Go to page without replacement using name of screen ////////////////////////////////////
  gotoPagewithReplacment(String routeName) {
    navkey.currentState.pushReplacementNamed(routeName);
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////Go to page without replacement with external animation ////////////////////////////////////
  goWithInternalAnimation(Widget widget) {
    navkey.currentState.pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        barrierColor: Colors.orangeAccent.withOpacity(0.1),
        transitionDuration: Duration(seconds: 1),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////Go to page with replacement with external animation ////////////////////////////////////
  goesWithInternalAnimation(Widget widget) {
    navkey.currentState.push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        barrierColor: Colors.orangeAccent.withOpacity(0.1),
        transitionDuration: Duration(seconds: 1),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////Back to screen when using push or pushnamed//////////////////////////////////////////////
  back() {
    navkey.currentState.pop();
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
