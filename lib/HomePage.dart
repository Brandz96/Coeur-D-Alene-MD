import 'package:flutter/material.dart';
import 'RootDictionaryPage.dart';
import 'AboutPage.dart';
import 'StemPage.dart';
import 'AudioPage.dart';
import 'AffixPage.dart';
import 'FeedBackPage.dart';
import 'main.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title,}) : super(key: key);


  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int counter = 0;
  Color homeBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
  Color buttonColors = Color.fromRGBO(170, 184, 194, 1);//grey
  Color iconColor = Colors.white;
  Color rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
  Color titleColor = Colors.white;



  @override
  Widget build(BuildContext context) {
    print(homeBackGroundColor.toString()); //ff1 = blue
    print(buttonColors.toString()); //ffaa = grey
    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 230,
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
                    SizedBox(height: 12.0),
                    Text(
                      'Mobile Dictionary',
                      style: TextStyle(
                        color: titleColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 12.0),
                  ],
                )),
          ),
          new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      HomePageToRootDictionaryPageTransition(context);
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
                new Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                     HomePageToStemPageTransition(context);
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
                new Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      HomePageToAffixPage(context);
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
                new Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      HomePageToAudioPage(context);
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
                new Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    onPressed: () {
                      HomePageToAboutPage(context);
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
                new Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                    color: getColor(),
                    elevation: 10,
                    splashColor: Colors.grey,
                    animationDuration: Duration(seconds: 2),
                    onPressed: () {
                      HomePageToFeedBackPage(context);
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
                    padding: EdgeInsets.only(top: 10),
                    child: IconButton(
                        icon: Icon(Icons.brightness_2),
                        color: iconColor,
                        iconSize: 20,
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
                              titleColor = Colors.white;
                            }
                          });

                          print(counter);
                        })),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Purdue Fort Wayne Capstone Project',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.white,
                    ),
                  ),
                )
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



  void setColor(int n) {
    if (n % 2 == 0) {
      buttonColors = Color.fromRGBO(170, 184, 194, 1);//grey
      iconColor = Colors.white;
      rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
      titleColor = Colors.white;
    } else {
      buttonColors = Color.fromRGBO(187, 134, 252, 1);//purple
      iconColor = Colors.white;
      rootDictionaryBackGroundColor = Color.fromRGBO(34, 28, 27, 1);//black
      titleColor = Colors.white;
    }
  }

  Color getColor() {
    return buttonColors;
  }


  void HomePageToRootDictionaryPageTransition(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new RootDictionaryPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors, counterFromPreviousPage: counter),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  void HomePageToStemPageTransition(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new StemPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  void HomePageToAffixPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AffixPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  void HomePageToAudioPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AudioPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  void HomePageToAboutPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AboutPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }

  void HomePageToFeedBackPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new FeedBackPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }
    ));
  }


  
  
  
  
  
  
  
}
