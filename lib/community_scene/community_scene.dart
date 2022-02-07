import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Community',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Center(
        child: Text('Page is under construction'),
      ),
    );
  }
}
