import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Auth/UI/LoginPage.dart';
import 'package:untitledfood/Auth/UI/MainAuth.dart';
import 'package:untitledfood/Auth/UI/NewPassword.dart';
import 'package:untitledfood/Auth/UI/SignupPage.dart';
import 'package:untitledfood/Services/Constants.dart';
import 'package:untitledfood/UIScreens/HomePageTabs.dart';
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
  // Call native code before run app
  WidgetsFlutterBinding.ensureInitialized();
  //Set Orientation for mobile in portrait Mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]
  );
  runApp(
    // Using Multi Provider for State Management
      MultiProvider(providers: [
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
    // Using for Responsive
    return ScreenUtilInit(
      designSize: const Size(widthDevice, heightDevice),
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
            HomePageTabs.routeName: (_) => HomePageTabs(),
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
