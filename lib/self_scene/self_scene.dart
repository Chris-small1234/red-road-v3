import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelfReliance extends StatefulWidget {
  const SelfReliance({Key? key}) : super(key: key);

  @override
  _SelfRelianceState createState() => _SelfRelianceState();
}

class _SelfRelianceState extends State<SelfReliance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Self Reliance',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Page is under construction'),
      ),
    );
  }
}
