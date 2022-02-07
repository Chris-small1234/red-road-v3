import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/home/help.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/start_scene/video_player.dart';
import 'package:red_road_v2/start_scene/widgets/checkinStartWidget.dart';
import 'package:red_road_v2/start_scene/widgets/helpStartWidget.dart';
import 'package:video_player/video_player.dart';

class StartScene extends StatefulWidget {
  @override
  StartSceneState createState() => StartSceneState();
}

class StartSceneState extends State<StartScene> {
  //final video = 'assets/video.mp4';
  //late VideoPlayerController controller;

  // @override
  // void initState() {
  //   super.initState();
  //   controller = VideoPlayerController.asset(video)
  //     ..addListener(() => setState(() {}))
  //     ..setLooping(false)
  //     ..initialize().then((value) => controller.play());
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  void _exercisesDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          insetPadding: EdgeInsets.all(5),
          title: new Text('Doing Exercises'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Text('Explanation of the exercise pages'),
                ),
                new Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  width: 200,
                  height: 300,
                  child: Image.asset(
                    './assets/startpage_icons/exercises.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new ElevatedButton(
              child: new Text('Get Started'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavHome()));
              },
            ),
          ],
        );
      },
    );
  }

  void _quoteGeneratorDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          insetPadding: EdgeInsets.all(5),
          title: new Text('Daily Inspirational Quotes'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  child: Text('Explaination of the quote generator'),
                ),
                new Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.blue[500]),
                  padding: EdgeInsets.all(5),
                  width: 200,
                  height: 300,
                  child: Image.asset(
                    './assets/startpage_icons/quotes.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new ElevatedButton(
              child: new Text('Get Started'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNavHome()));
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * .14;
    var width = MediaQuery.of(context).size.width * .7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Start Here'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, height)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckInStartWidget()));
                    },
                    child: Column(
                      children: [
                        Text(
                          'Daily Check-In',
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.blue[500],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, height)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HelpStartWidget()));
                    },
                    child: Column(
                      children: [
                        Text(
                          'Help at the ready',
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.blue[500],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, height)),
                    onPressed: () {
                      _exercisesDialog();
                    },
                    child: Column(
                      children: [
                        Text(
                          'Exercises',
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.blue[500],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, height)),
                    onPressed: () {
                      _quoteGeneratorDialog();
                    },
                    child: Column(
                      children: [
                        Text(
                          'Inspirational Quotes',
                          style: TextStyle(
                            fontSize: 20,
                            backgroundColor: Colors.blue[500],
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //VideoPlayerWidget(controller: controller),
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
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
