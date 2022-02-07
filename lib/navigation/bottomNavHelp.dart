import 'package:flutter/material.dart';
import 'package:red_road_v2/home/help.dart';
import 'package:red_road_v2/home/home_widgets/home.dart';

class BottomNavHelp extends StatefulWidget {
  BottomNavHelp({Key? key}) : super(key: key);

  @override
  _BottomNavHelpState createState() => _BottomNavHelpState();
}

class _BottomNavHelpState extends State<BottomNavHelp> {
  int currentTabIndex = 0;
  late List<Widget> pages;

  late Widget currentPage;
  late Home homepage;
  late Help helpPage;

  @override
  void initState() {
    super.initState();

    homepage = Home();
    helpPage = Help();
    pages = [homepage, helpPage];
    currentPage = helpPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
        ],
      ),
      body: currentPage,
    );
  }
}
