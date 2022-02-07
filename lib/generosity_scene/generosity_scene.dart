import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Generosity extends StatefulWidget {
  const Generosity({Key? key}) : super(key: key);

  @override
  _GenerosityState createState() => _GenerosityState();
}

class _GenerosityState extends State<Generosity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Text(
          'Generosity',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: Center(
        child: Text('Page is under construction'),
      ),
    );
  }
}
