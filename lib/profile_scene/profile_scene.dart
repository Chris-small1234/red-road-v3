import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScene extends StatefulWidget {
  const ProfileScene({Key? key}) : super(key: key);

  @override
  _ProfileSceneState createState() => _ProfileSceneState();
}

class _ProfileSceneState extends State<ProfileScene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        //toolbarHeight: MediaQuery.of(Container).size.height,
        title: Text(
          'You',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Text('Page is under construction'),
      ),
    );
  }
}
