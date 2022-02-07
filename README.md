# Red-Road-Wellness V3

### Last Updated: January 27, 2022

#### This project is a complete mess and can be better organized. Good luck to anyone needing to change things.  

### Latest Update:
Fixed Quote generator issue. (Quotes were not writing to the local storage).

## To Report A Bug:
[Report It Here](https://docs.google.com/forms/d/e/1FAIpQLSfwNEIgMQ1nhcDKuZfnd6yGRo5dN-t9FA7asvWqmErlPUznaw/viewform?usp=sf_link)

## Firebase
#### Note: Only Jim, Chris and Chris have access.
[Red-Road-Wellness-Firebase](https://console.firebase.google.com/u/0/project/red-road-wellness/overview)


## Google Drive Resources: 
#### Note: Recent APKs are released through the drive.
[Red-Road-Wellness-Drive](https://drive.google.com/drive/folders/1loS0F8CbgRMjcXhiDw7IUMtQpq3KzkXx?usp=sharing)

## Slack Group
[Westie-Design-Slack-Workplace](https://westiedesign.slack.com)

## Issues:
### Bugs:
- [x] iOS Build (Certain Files Require iOS Deployment Changes)
- [x] The ListView doesn't scroll because it is a nested container
- [x] The Quotes are pull from the db everytime the user goes to the homepage. Needs to pull it on launch then store it.

### TODO:
- [x] Read About and Implement [CustomScrollViews](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html)
- [x] Read About and Implement [Slivers](https://docs.flutter.dev/development/ui/advanced/slivers)
- [x] Re-design Home screen with container widgets and cards
- [x] Implement Dialog box for Mental, Relational, Spiritual, Physical (Done Mental section)
- [x] Create Seperate Firestore Read Methods for each test section (Mental, Relational, Spiritual, Physical) | Done Mental
- [x] Daily Quote Generator
- [ ] Remove Hard-Coded Values
- [ ] Do Extras Pages (Examples: Free Giving, Community, etc.)
- [ ] Create Demo Video for start page
- [ ] Design and Implement Logo for Splash Screen
- [ ] Design and Implement Start Section
- [ ] Testing (Allow up to a month)

<br/>

### Old Home page UI
```dart
class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    double buttonWidth = MediaQuery.of(context).size.width *
        0.5; //getting half of the current width for each button

    //#region Get Quotes
    // Gets a particular quote depending on the day of the month
    List<String> quotes = <String>[];
    void getQuoteList() async {
      var tempList = await QuoteGenerator().getQuotes();
      quotes = tempList!;
    }

    var date = DateTime.now().day;
    //var todaysQuote = quotes[date];
    //#endregion

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue[500],
          title: Text('Home'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  minimumSize: Size(100, 20),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  primary: Colors.green,
                ),
                onPressed: () {
                  // Navigate
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StartScene()));
                },
                child: Text(
                  'Start',
                ),
              ),
            ),
            Container(
              height: 370,
              width: 350,
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              //padding: EdgeInsets.all(0),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 30,
                      left: 20,
                      width: 150,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Relational()));
                          },
                          child: Image(
                              image: AssetImage('assets/buttons/blue.png')))),
                  Positioned(
                      top: 160,
                      left: 20,
                      width: 148,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Physical()));
                          },
                          child: Image(
                              image: AssetImage('assets/buttons/white.png')))),
                  Positioned(
                      top: 160,
                      left: 158,
                      width: 148,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mental()));
                          },
                          child: Image(
                              image: AssetImage('assets/buttons/yellow.png')))),
                  Positioned(
                      top: 28,
                      left: 158,
                      width: 148,
                      height: 150,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Spiritual()));
                          },
                          child: Image(
                              image: AssetImage('assets/buttons/red.png')))),
                  Positioned(
                      top: 270,
                      left: 60,
                      width: 208,
                      height: 70,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Generosity()));
                          },
                          child: Image(
                              image: AssetImage(
                                  'assets/buttons/light yellow.png')))),
                  Positioned(
                      //  top: ,
                      left: 65,
                      width: 210,
                      height: 70,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelfReliance()));
                          },
                          child: Image(
                              image: AssetImage('assets/buttons/brown.png')))),
                  Positioned(
                      top: 80,
                      left: 260,
                      width: 60,
                      height: 180,
                      child: InkWell(
                          onTap: () {
                            //welcomePage.UserType = "User";
                            // print(welcomePage.UserType);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mastery()));
                          },
                          child: Image(
                              image: AssetImage(
                                  'assets/buttons/orange curve.png')))),
                  Positioned(
                    top: 80,
                    left: 01,
                    width: 60,
                    height: 190,
                    child: InkWell(
                      onTap: () {
                        //welcomePage.UserType = "User";
                        // print(welcomePage.UserType);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Community()));
                      },
                      child: Image(
                        image: AssetImage('assets/buttons/green.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _size.width * .7,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '', //${todaysQuote}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // Widget

  Widget button(
      {required VoidCallback onPressed,
      required double buttonWidth,
      required String buttonText}) {
    return Container(
      width: buttonWidth,
      padding: const EdgeInsets.all(5.0),
      height: 80,
      child: RaisedButton(
        color: Colors.purpleAccent[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 111, 172, 38)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3291667, size.height * 0.5624037);
    path_0.lineTo(size.width * 0.3291667, size.height * 0.5624037);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(255, 111, 172, 38)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 35.31;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3916667, size.height * 0.2311248);
    path_1.quadraticBezierTo(size.width * 0.3219583, size.height * 0.3479661,
        size.width * 0.3583333, size.height * 0.5546995);

    canvas.drawPath(path_1, paint_1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
```

#### Details
*Email Chris Small For Questions: smallchris19@gmail.com*
<br/>
*Owned by Westie Design Inc.*
<br/>
*Red-Road-Wellness was managed and developed by Chris Small, with help from Chris Stoklosa and Jim Bilodeau*
