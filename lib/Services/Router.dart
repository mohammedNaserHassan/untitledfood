import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  AppRouter._();

  static AppRouter appRouter = AppRouter._();
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  gotoPage(String routeName) {
    navkey.currentState.pushNamed(routeName);
  }

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

  gotoPagewithReplacment(String routeName) {
    navkey.currentState.pushReplacementNamed(routeName);
  }

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

  back() {
    navkey.currentState.pop();
  }
}
