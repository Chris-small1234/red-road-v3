import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/models/mental.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/util/constants.dart';
import 'package:red_road_v2/util/firebase_manager.dart';
import 'mental_results.dart';

class Mental extends StatefulWidget {
  const Mental({Key? key}) : super(key: key);

  @override
  MentalState createState() => MentalState();
}

class MentalState extends State<Mental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Mental',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            // Question 1
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question1}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue1,
                    onChanged: (newSliderValue1) {
                      setState(
                          () => MentalModel.sliderValue1 = newSliderValue1);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // Question 2
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question2}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue2,
                    onChanged: (newSliderValue2) {
                      setState(
                          () => MentalModel.sliderValue2 = newSliderValue2);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question3}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue3,
                    onChanged: (newSliderValue3) {
                      setState(
                          () => MentalModel.sliderValue3 = newSliderValue3);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question4}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue4,
                    onChanged: (newSliderValue4) {
                      setState(
                          () => MentalModel.sliderValue4 = newSliderValue4);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question5}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue5,
                    onChanged: (newSliderValue5) {
                      setState(
                          () => MentalModel.sliderValue5 = newSliderValue5);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.yellow),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${MentalModel.question6}',
                    style: TextStyle(color: Colors.black),
                  ),
                  Slider(
                    value: MentalModel.sliderValue6,
                    onChanged: (newSliderValue6) {
                      setState(
                          () => MentalModel.sliderValue6 = newSliderValue6);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Sets the day it was done
                int today = DateTime.now().day;
                final FirebaseManager db = new FirebaseManager();
                db.sectionType = "mental";
                db.writeDate(today, db.sectionType);
                // Navigate to Mental results and save answers
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Mental_Results()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                primary: Colors.yellow,
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      // Bottom Nav Bar
      persistentFooterButtons: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavHome()));
                    },
                    child: Column(
                      children: [Icon(Icons.home), Text("Home")],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavHelp()));
                    },
                    child: Column(
                      children: [Icon(Icons.help), Text("Help")],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
