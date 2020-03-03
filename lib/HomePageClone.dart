import 'package:flutter/material.dart';
import 'RootDictionaryPage.dart';
import 'AboutPage.dart';
import 'StemPage.dart';
import 'AudioPage.dart';
import 'AffixPage.dart';
import 'FeedBackPage.dart';
import 'main.dart';

class HomePageClone extends StatefulWidget {
  HomePageClone({Key key, this.title, this.backGroundColor, this.tileBackGroundColor}) : super(key: key);
  Color backGroundColor;
  Color tileBackGroundColor;



  final String title;

  @override
  _HomePageClone createState() => _HomePageClone(backGroundColor, tileBackGroundColor);
}

class _HomePageClone extends State<HomePageClone> {
  Color backGroundColor;
  Color tileBackGroundColor;

  _HomePageClone(this.backGroundColor, this.tileBackGroundColor);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(105),
                  bottomLeft: Radius.circular(105)),
              color: backGroundColor,
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
                            color: tileBackGroundColor,
                            fontFamily: "Open Sans"),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      'Mobile Dictionary',
                      style: TextStyle(
                        color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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
                    color: tileBackGroundColor,
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


  void HomePageToRootDictionaryPageTransition(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new RootDictionaryPage(
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor),
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
