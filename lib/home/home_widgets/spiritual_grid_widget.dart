import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/spiritual_scene/spiritual_scene.dart';
import 'package:red_road_v2/util/firebase_manager.dart';

class SpiritualWidget extends StatefulWidget {
  const SpiritualWidget({Key? key}) : super(key: key);

  @override
  _SpiritualWidgetState createState() => _SpiritualWidgetState();
}

class _SpiritualWidgetState extends State<SpiritualWidget> {
  var today = DateTime.now().day;
  int date = 0;
  FirebaseManager db = new FirebaseManager();

  // This is a alert that warns the user that they will be doing the test for the second time today
  void _dialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('You have already done this today'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(
                    'Are you sure you want to do this again? You have already done it once today.'),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new ElevatedButton(
              child: new Text('Do Again'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Spiritual()));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    db.sectionType = "spiritual";
    return new FutureBuilder(
      future: db.readDate(db.day, db.sectionType),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue[900],
            minimumSize: Size(
              MediaQuery.of(context).size.width * .7,
              MediaQuery.of(context).size.height * .7,
            ),
          ),
          onPressed: () {
            // Determine if the user has already done it today
            if (today != snapshot.data) {
              // Navigate to Physical results and save answers
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Spiritual()));
            } else {
              _dialog();
            }
          },
          child: Column(
            children: <Widget>[
              Text(
                'Spiritual',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  './assets/homepage_icons/spiritual_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
