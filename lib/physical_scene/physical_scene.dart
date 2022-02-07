import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/models/physical.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/physical_scene/physical_results.dart';
import 'package:red_road_v2/util/constants.dart';
import 'package:red_road_v2/util/firebase_manager.dart';

class Physical extends StatefulWidget {
  const Physical({Key? key}) : super(key: key);

  @override
  PhysicalState createState() => PhysicalState();
}

class PhysicalState extends State<Physical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Physical',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
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
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue1,
                    onChanged: (newSliderValue1) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue1 = newSliderValue1);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            // Question 2
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question2}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue2,
                    onChanged: (newSliderValue2) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue2 = newSliderValue2);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question3}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue3,
                    onChanged: (newSliderValue3) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue3 = newSliderValue3);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question4}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue4,
                    onChanged: (newSliderValue4) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue4 = newSliderValue4);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question5}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue5,
                    onChanged: (newSliderValue5) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue5 = newSliderValue5);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.grey),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${PhysicalSceneModel.question6}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: PhysicalSceneModel.sliderValue6,
                    onChanged: (newSliderValue6) {
                      setState(() =>
                          PhysicalSceneModel.sliderValue6 = newSliderValue6);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.black,
                  ),
                  Text(
                    '${sliderStringsLeftToRight}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Sets the day it was done
                int today = DateTime.now().day;
                final FirebaseManager db = new FirebaseManager();
                db.sectionType = "physical";
                db.writeDate(today, db.sectionType);
                // Navigate to Physical results and save answers
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Physical_Results()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //minimumSize: Size(100, 40),
                //padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                primary: Colors.grey,
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
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
