import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/models/mental.dart';
import 'package:red_road_v2/navigation/bottomNavHelp.dart';
import 'package:red_road_v2/navigation/bottomNavHome.dart';
import 'package:red_road_v2/util/constants.dart';
import 'package:red_road_v2/util/firebase_manager.dart';
import 'package:red_road_v2/util/localStorage.dart';
import '../providers/api.dart';

class Mental_Results extends StatefulWidget {
  const Mental_Results({Key? key}) : super(key: key);

  @override
  _Mental_ResultsState createState() => _Mental_ResultsState();
}

class _Mental_ResultsState extends State<Mental_Results> {
  String score = "0";
  Api api = new Api();

  var thisScore;

  @override
  void initState() {
    super.initState();
    score = calculateScore();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.yellow,
        title: Text(
          'Progress',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: _size.height * .7,
            width: _size.width,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.yellow,
            ),
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: processScore(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    thisScore = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .7,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.yellow[600],
                                ),
                                child: BarChart(
                                  barChartData(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            primary: Colors.yellow[600],
                          ),
                          onPressed: () {
                            // Reset the slider values
                            resetSliderValues();
                            // Navigate to Relational results and save answers
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNavHome()));
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('A problem has occurred... Please try again');
                  }
                }
                return Container();
              },
            ),
          ),
        ),
      ),
      // Bottom Nav Bar
      persistentFooterButtons: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
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
                  GestureDetector(
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  barChartData() {
    return BarChartData(
      barTouchData: barTouchData,
      titlesData: titlesData,
      borderData: borderData,
      barGroups: barGroups,
      //alignment: BarChartAlignment.spaceAround,
      backgroundColor: Colors.yellow[200],
      maxY: 100,
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.yellow[200],
          tooltipPadding: const EdgeInsets.all(0),
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.y.round().toString(),
              const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          margin: 5,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return tableAverageLabel;
              case 1:
                return tableTodayLabel;
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
                y: double.parse(thisScore),
                colors: [Colors.black, Colors.white])
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                y: double.parse(score), colors: [Colors.black, Colors.white])
          ],
          showingTooltipIndicators: [0],
        ),
      ];

  /// Calculate the score from the previous page
  String calculateScore() {
    List<double> vals = [
      MentalModel.sliderValue1,
      MentalModel.sliderValue2,
      MentalModel.sliderValue3,
      MentalModel.sliderValue4,
      MentalModel.sliderValue5,
      MentalModel.sliderValue6
    ];
    return api.getAverageFromList(vals);
  }

  /// Process the score using the API provider
  Future<String> processScore() async {
    return api.processScore('mental', double.parse(score)).then((val) {
      if (val.isNotEmpty) {
        return api.getAverageFromList(val);
      }
      return "0";
    });
  }

  resetSliderValues() {
    MentalModel.sliderValue1 = 50;
    MentalModel.sliderValue2 = 50;
    MentalModel.sliderValue3 = 50;
    MentalModel.sliderValue4 = 50;
    MentalModel.sliderValue5 = 50;
    MentalModel.sliderValue6 = 50;
  }
}
