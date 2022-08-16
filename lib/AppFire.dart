import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'UIScreens/SplachScreen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Container(
              child: Text('error',style: TextStyle(color: Colors.red),),
            ),
          );
        }
        // if all Done!!!
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: SplachScreen(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
