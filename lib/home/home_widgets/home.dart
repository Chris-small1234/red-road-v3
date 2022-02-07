import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_road_v2/community_scene/community_scene.dart';
import 'package:red_road_v2/generosity_scene/generosity_scene.dart';
import 'package:red_road_v2/home/home_widgets/mental_grid_widget.dart';
import 'package:red_road_v2/home/home_widgets/physical_grid_widget.dart';
import 'package:red_road_v2/home/home_widgets/relational_grid_widget.dart';
import 'package:red_road_v2/home/home_widgets/spiritual_grid_widget.dart';
import 'package:red_road_v2/mastery_scene/mastery_scene.dart';
import 'package:red_road_v2/self_scene/self_scene.dart';
import 'package:red_road_v2/start_scene/start_scene.dart';
import 'package:red_road_v2/util/firebase_manager.dart';
import 'package:red_road_v2/util/getQuotes.dart';
import 'package:red_road_v2/util/localStorage.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

getWidget(int index) {
  if (index == 0) {
    return RelationalWidget();
  } else if (index == 1) {
    return SpiritualWidget();
  } else if (index == 2) {
    return PhysicalWidget();
  } else if (index == 3) {
    return MentalWidget();
  }
}

class HomeState extends State<Home> {
  FirebaseManager db = new FirebaseManager();
  var todayQuote;

  // This writes the quote of the day to the local storage, but it only runs when the user opens the app.
  void initState() {
    getQuotes writeQuotes = new getQuotes();
    writeQuotes.writeQuoteFuture();
  }

  // This is a alert that warns the user that they will be signing out.
  void _signOutDialog() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Sign Out'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text('Are you sure you want to sign out?'),
              ],
            ),
          ),
          actions: [
            new ElevatedButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new ElevatedButton(
              child: new Text('Sign Out'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.blue[500],
        title: Text('Red Road Wellness'),
        actions: [
          IconButton(
              onPressed: () {
                _signOutDialog();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                ),
                onPressed: () {
                  // Navigate to Physical results and save answers
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartScene()));
                },
                child: Text(
                  'Start',
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  child: getWidget(index),
                );
              },
              childCount: 4,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Self Reliance
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue[200]),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Physical results and save answers
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelfReliance()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'Self Reliance',
                              style: TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                './assets/homepage_icons/self_reliance_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Community
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue[200]),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Physical results and save answers
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Community()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'Community',
                              style: TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                './assets/homepage_icons/community_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Mastery
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue[200]),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Physical results and save answers
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mastery()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'Mastery',
                              style: TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                './assets/homepage_icons/mastery_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Free Giving
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue[200]),
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to Physical results and save answers
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Generosity()));
                        },
                        child: Column(
                          children: [
                            Text(
                              'Generosity',
                              style: TextStyle(
                                fontSize: 20,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                './assets/homepage_icons/generosity_logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: Colors.blue[200]),
              margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
              padding: EdgeInsets.all(5),
              child: Center(
                child: FutureBuilder(
                  future: getQuoteFuture(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Object> getQuoteFuture() async {
    FirebaseManager db = new FirebaseManager();
    LocalStorage storage = new LocalStorage();
    var error = 'Cannot load quotes';
    var today;
    todayQuote = await storage.readContent();
    if (todayQuote != null) {
      return todayQuote;
    } else {
      var quotes;
      String? todayQuote;
      db.sectionType = "home";
      today = await db.readDate(db.day, db.sectionType);
      quotes = await db.readQuote(quotes);
      if (quotes != null) {
        await storage.writeContent(quotes[today]);
        todayQuote = await storage.readContent();
      }
      if (todayQuote != null) {
        return todayQuote;
      } else {
        return error;
      }
    }
  }
}
