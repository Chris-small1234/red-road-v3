import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/util/firebase_manager.dart';
import 'package:red_road_v2/util/localStorage.dart';

class Splash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Splash> {
  startTime() async {
    var _duration = Duration(milliseconds: 100);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    if (FirebaseAuth.instance.currentUser == null) {
      Navigator.pushReplacementNamed(context, '/login');
      print('User is currently signed out!');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
      print('User is signed in!');
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), startTime);

    //startTime();
  }

  @override
  Widget build(BuildContext context) {
    // Sets the day it was done
    int today = DateTime.now().day;
    final FirebaseManager db = new FirebaseManager();
    db.sectionType = "home";
    db.writeDate(today, db.sectionType);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
