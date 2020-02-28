import 'package:flutter/material.dart';
import 'RootDictionaryPage.dart';
import 'AboutPage.dart';
import 'StemPage.dart';
import 'AudioPage.dart';
import 'AffixPage.dart';
import 'FeedBackPage.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  final List<String> _data = [
    "Root Dictionary",
    "Stem List",
    "Affix List",
    "Audio Files",
    "About",
    "Feedback",
  ];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(105),
                  bottomLeft: Radius.circular(105)),
              color: homeBackGroundColor,
            ),
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 300.0,
                      margin: EdgeInsets.only(top: 75),
                      child: Text(
                        'Coeur D\' Alene',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            color: titleColor,
                            fontFamily: "Open Sans"),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Mobile Dictionary',
                      style: TextStyle(
                        color: titleColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                )),
          ),
          new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.only(top: 0)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RootDictionaryPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Root Dictionary",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Open Sans'),
                          ),
                        ))),
                new Padding(padding: EdgeInsets.only(top: 20)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StemPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Stem List",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Open Sans'),
                          ),
                        ))),
                new Padding(padding: EdgeInsets.only(top: 20)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AffixPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Affix List",
                            textAlign: TextAlign.center,
                          ),
                        ))),
                new Padding(padding: EdgeInsets.only(top: 20)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AudioPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Text and Audio Files",
                            textAlign: TextAlign.center,
                          ),
                        ))),
                new Padding(padding: EdgeInsets.only(top: 20)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "About",
                            textAlign: TextAlign.center,
                          ),
                        ))),
                new Padding(padding: EdgeInsets.only(top: 20)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    splashColor: Colors.grey,
                    animationDuration: Duration(seconds: 2),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedBackPage(
                                  backGroundColor:
                                      rootDictionaryBackGroundColor,
                                  tileBackGroundColor: buttonColors)));
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    padding: const EdgeInsets.all(0),
                    child: Ink(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Container(
                          width: 350,
                          height: 20,
                          constraints:
                              const BoxConstraints(minWidth: 40, minHeight: 40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Provide Feedback",
                            textAlign: TextAlign.center,
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 25, right: 329),
                    child: IconButton(
                        icon: Icon(Icons.brightness_2),
                        color: iconColor,
                        onPressed: () {
                          _incrementCounter();
                          setState(() {
                            if (counter % 2 == 0 || counter == 0) {
                              homeBackGroundColor =
                                  Color.fromRGBO(29, 161, 242, 1);

                              setColor(counter);
                              buttonColors = Color.fromRGBO(170, 184, 194, 1);
                              titleColor = Colors.white;
                            } else {
                              homeBackGroundColor =
                                  Color.fromRGBO(34, 28, 27, 1);

                              setColor(counter);
                              buttonColors = Color.fromRGBO(187, 134, 252, 1);
                              titleColor = buttonColors;
                            }
                          });

                          print(counter);
                        })),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  Color homeBackGroundColor = Color.fromRGBO(29, 161, 242, 1);
  Color buttonColors = Color.fromRGBO(170, 184, 194, 1);
  Color iconColor = Colors.black;
  Color rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);
  Color titleColor = Colors.white;

  void setColor(int n) {
    if (n % 2 == 0) {
      buttonColors = Color.fromRGBO(170, 184, 194, 1);
      iconColor = Colors.black;
      rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);
      titleColor = Colors.white;
    } else {
      buttonColors = Color.fromRGBO(3, 173, 197, 1);
      iconColor = Colors.white;
      rootDictionaryBackGroundColor = Color.fromRGBO(34, 28, 27, 1);
      titleColor = buttonColors;
    }
  }

  Color getColor() {
    return buttonColors;
  }
}
