import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/models/relational.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/relational_scene/relational_results.dart';
import 'package:red_road_v2/util/firebase_manager.dart';

class Relational extends StatefulWidget {
  const Relational({Key? key}) : super(key: key);

  @override
  RelationalState createState() => RelationalState();
}

class RelationalState extends State<Relational> {
  @override
  Widget build(BuildContext context) {
    //var sliderValues = [50, 50, 50, 50, 50];
    //RelationalModel.getSliderValues(sliderValues);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Relational'),
        backgroundColor: Colors.blue,
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
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question1}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue1,
                    onChanged: (newSliderValue1) {
                      setState(
                          () => RelationalModel.sliderValue1 = newSliderValue1);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
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
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question2}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue2,
                    onChanged: (newSliderValue2) {
                      setState(
                          () => RelationalModel.sliderValue2 = newSliderValue2);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question3}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue3,
                    onChanged: (newSliderValue3) {
                      setState(
                          () => RelationalModel.sliderValue3 = newSliderValue3);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question4}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue4,
                    onChanged: (newSliderValue4) {
                      setState(
                          () => RelationalModel.sliderValue4 = newSliderValue4);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question5}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue5,
                    onChanged: (newSliderValue5) {
                      setState(
                          () => RelationalModel.sliderValue5 = newSliderValue5);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue),
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    '${RelationalModel.question6}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Slider(
                    value: RelationalModel.sliderValue6,
                    onChanged: (newSliderValue6) {
                      setState(
                          () => RelationalModel.sliderValue6 = newSliderValue6);
                    },
                    divisions: 4,
                    min: 0,
                    max: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  Text(
                    '${RelationalModel.sliderStrings}',
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
                db.sectionType = "relational";
                db.writeDate(today, db.sectionType);
                // Navigate to Relational results and save answers
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Relational_Results()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //minimumSize: Size(100, 40),
                //padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                primary: Colors.blue,
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
