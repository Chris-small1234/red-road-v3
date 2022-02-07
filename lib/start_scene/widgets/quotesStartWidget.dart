import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';

class QuoteStartWidget extends StatelessWidget {
  const QuoteStartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListView(
            children: [],
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
