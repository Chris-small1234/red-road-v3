import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/models/spiritual.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/spiritual_scene/spiritual_results.dart';
import 'package:red_road_v2/util/colors.dart';
import 'package:red_road_v2/util/constants.dart';
import 'package:red_road_v2/util/firebase_manager.dart';

class Spiritual extends StatefulWidget {
  const Spiritual({Key? key}) : super(key: key);

  @override
  SpiritualState createState() => SpiritualState();
}

class SpiritualState extends State<Spiritual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Spiritual',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.red[900],
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
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question1}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue1,
                    onChanged: (newSliderValue1) {
                      setState(
                          () => SpiritualModel.sliderValue1 = newSliderValue1);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            // Question 2
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question2}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue2,
                    onChanged: (newSliderValue2) {
                      setState(
                          () => SpiritualModel.sliderValue2 = newSliderValue2);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question3}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue3,
                    onChanged: (newSliderValue3) {
                      setState(
                          () => SpiritualModel.sliderValue3 = newSliderValue3);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question4}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue4,
                    onChanged: (newSliderValue4) {
                      setState(
                          () => SpiritualModel.sliderValue4 = newSliderValue4);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question5}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue5,
                    onChanged: (newSliderValue5) {
                      setState(
                          () => SpiritualModel.sliderValue5 = newSliderValue5);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.red[900]),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${SpiritualModel.question6}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                  Slider(
                    value: SpiritualModel.sliderValue6,
                    onChanged: (newSliderValue6) {
                      setState(
                          () => SpiritualModel.sliderValue6 = newSliderValue6);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: spiritualSlidersPrimary,
                    inactiveColor: spiritualSlidersSecondary,
                  ),
                  Text(
                    '${sliderStringsRightToLeft}',
                    style: TextStyle(color: spiritualLabels),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Sets the day it was done
                int today = DateTime.now().day;
                final FirebaseManager db = new FirebaseManager();
                db.sectionType = "spiritual";
                db.writeDate(today, db.sectionType);

                // Navigate to Spiritual results and save answers
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Spiritual_Results()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //minimumSize: Size(100, 40),
                //padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                primary: Colors.red[900],
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
