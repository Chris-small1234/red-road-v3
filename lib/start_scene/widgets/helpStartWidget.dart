import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/home/help.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';

class HelpStartWidget extends StatelessWidget {
  const HelpStartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView(
            children: [
              Container(
                child: new SingleChildScrollView(
                  child: new ListBody(
                    children: [
                      new Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue[500]),
                        padding: EdgeInsets.all(5),
                        child: Text('Explaination of the help page'),
                      ),
                      new Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue[500]),
                        padding: EdgeInsets.all(5),
                        width: 200,
                        height: 370,
                        child: Image.asset(
                          './assets/startpage_icons/help.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
                    //Spacer(),
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
    ;
  }
}
