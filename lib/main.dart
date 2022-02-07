import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/util/firebase_manager.dart';
import 'auth/signup.dart';
import 'auth/login.dart';
import 'auth/resetPassword.dart';
import 'auth/splash.dart';
import 'navigation/bottomNavHome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // This sets the local storage to default values on first run
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Red Road Wellness',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/login': (context) => LoginScreen(),
              '/SignUp': (context) => SignUpPage(),
              '/resetPassword': (context) => ResetPassword(),
              '/home': (context) => BottomNavHome(),
            },
            home: Splash(),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
