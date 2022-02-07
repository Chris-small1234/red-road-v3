import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mastery extends StatefulWidget {
  const Mastery({Key? key}) : super(key: key);

  @override
  _MasteryState createState() => _MasteryState();
}

class _MasteryState extends State<Mastery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Mastery',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Page is under construction'),
      ),
    );
  }
}
