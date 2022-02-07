import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';

class CheckInStartWidget extends StatefulWidget {
  @override
  CheckInStartWidgetState createState() => CheckInStartWidgetState();
}

class CheckInStartWidgetState extends State<CheckInStartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Daily Check-Ins'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'These four tiles are your daily check-ins. Each one represents a different aspect of life.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * .3,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    './assets/startpage_icons/checkin/home.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Each section will have specific questions about the topic. Make sure to fill these out as honestly as possible for the best results.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * .8,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    './assets/startpage_icons/checkin/questions.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Now you can compare today with how you are usually doing. Remember the higher the score the better your doing!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .2,
                  height: MediaQuery.of(context).size.height * .8,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Image.asset(
                    './assets/startpage_icons/checkin/results.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      primary: Colors.blue[600],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavHome()));
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: GestureDetector(
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
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: GestureDetector(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
