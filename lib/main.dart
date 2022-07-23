import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/LoginPage.dart';
import 'package:untitledfood/Auth/UI/MainAuth.dart';
import 'package:untitledfood/Auth/UI/NewPassword.dart';
import 'package:untitledfood/Auth/UI/SignupPage.dart';
import 'package:untitledfood/UIScreens/HomePage.dart';
import 'package:untitledfood/UIScreens/MealDetails.dart';
import 'package:untitledfood/UIScreens/Boarding/Slider_one.dart';
import 'package:untitledfood/UIScreens/Boarding/Slider_two.dart';
import 'package:untitledfood/UIScreens/SplachScreen.dart';
import 'AppFire.dart';
import 'Auth/UI/OTPhone.dart';
import 'Auth/UI/ResetPassword.dart';
import 'Providers/AuthProvider.dart';
import 'Providers/MyProvider.dart';
import 'Services/Router.dart';
import 'Taps/MainHome.dart';
import 'UIScreens/Boarding/Slider_three.dart';
import 'UIScreens/MealsCategory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7, 834.9),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0)),
          debugShowCheckedModeBanner: false,
          routes: {
            SplachScreen.routeName: (_) => SplachScreen(),
            MainAuth.routeName: (_) => MainAuth(),
            LoginPage.routeName: (_) => LoginPage(),
            SignupPage.routeName: (_) => SignupPage(),
            ResetPassword.routeName: (_) => ResetPassword(),
            CodeMobile.routeName: (_) => CodeMobile(),
            NewPassword.routeName: (_) => NewPassword(),
            Slider_one.routeName: (_) => Slider_one(),
            Slider_two.routeName: (_) => Slider_two(),
            Slider_three.routeName: (_) => Slider_three(),
            HomePage.routeName: (_) => HomePage(),
            MealsCategory.routeName: (_) => MealsCategory(),
            MealDetails.routeName: (_) => MealDetails(),
            MainHome.routeName: (_) => MainHome(),
          },
          home: App(),
          navigatorKey: AppRouter.appRouter.navkey,
        );
      },
    );
  }
}

