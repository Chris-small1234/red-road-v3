import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:red_road_v2/models/helpModel.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Help extends StatefulWidget {
  Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          'Help is Available',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
          minWidth: 300,
          maxWidth: 450,
          minHeight: 300,
          maxHeight: 800,
        ),
        decoration: BoxDecoration(
          color: Colors.blue[200],
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    HelpModel.emergency911,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.emergency911}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Kids Help Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.kidsHelpPhone}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Text(
                  'Text CONNECT to 686868',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Kids Help Chat Services [6pm - 2am EST]',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => launch('${HelpModel.kidsHelpWeb}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Trans Lifeline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.transLifeline}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Hope for Wellness Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.hopeForWellnessPhone}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Hope for Wellness Online Chat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () => launch('${HelpModel.hopeForWellnessWeb}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Indian Residential Crisis Line',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.residentialSchoolPhone}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: GestureDetector(
                  child: Text(
                    'Suicide Prevention Line',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.canadianSuicidePreventionPhone}'),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: GestureDetector(
                  child: Text(
                    '(For Quecbec Residents)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => FlutterPhoneDirectCaller.callNumber(
                      '${HelpModel.quebecSuicidePreventionPhone}'),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 30),
                child: GestureDetector(
                  child: Text(
                    'Report a problem with the app',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () async => launch(
                      'https://docs.google.com/forms/d/e/1FAIpQLSfwNEIgMQ1nhcDKuZfnd6yGRo5dN-t9FA7asvWqmErlPUznaw/viewform?usp=sf_link'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
