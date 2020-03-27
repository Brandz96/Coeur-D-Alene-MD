import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'AboutPage.dart';
import 'AffixPage.dart';
import 'AudioPage.dart';
import 'FeedBackPage.dart';
import 'HomePage.dart';
import 'RootDictionaryPage.dart';
import 'StemPage.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      RootDictionaryPage.routeName: (BuildContext context) =>
      new RootDictionaryPage(title: 'RootDictionaryPage'),
      AboutPage.routeName: (BuildContext context) => new AboutPage(
        title: 'AboutPage',
      ),
      StemPage.routeName: (BuildContext context) => new StemPage(
        title: 'StemPage',
      ),
      AudioPage.routeName: (BuildContext context) =>
      new AudioPage(title: 'Audio'),
      AffixPage.routeName: (BuildContext context) =>
      new AffixPage(title: 'Affix'),
      FeedBackPage.routeName: (BuildContext context) =>
      new FeedBackPage(title: 'FeedBack'),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(unselectedWidgetColor: Colors.white70),
      home: WelcomePage(),
      routes: routes,
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 28, 30, 1),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/Dictionary.png',
                  height: 250,
                  width: 250,
                ),
              ),
              RaisedButton(
                  color: Color.fromRGBO(50, 66, 127, 1),
                  elevation: 3,
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(new PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                        new LoadingPage(),
                        maintainState: true,
                        opaque: true,
                        transitionDuration: Duration(milliseconds: 600),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        }));
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(0),
                  child: Ink(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Container(
                        width: 350,
                        height: 20,
                        constraints:
                        const BoxConstraints(minWidth: 40, minHeight: 40),
                        alignment: Alignment.center,
                        child: const Text(
                          "Enter",
                          style: TextStyle(
                            fontFamily: 'Open Sans',
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            ],
          ),
        ));
  }
}

class LoadingPage extends StatefulWidget {
  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  void navigationToNextPage() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => new Home(),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(seconds: 1),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }));
  }

  startLoadingScreenTimer() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startLoadingScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 28, 30, 1),
      body: Center(
          child: SpinKitWave(
            color: Color.fromRGBO(50, 66, 127, 1),
            size: 40,
            duration: Duration(milliseconds: 800),
          )),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//    List<Slide> slides = new List();
//
//    void initState(){
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "Root Dictionary",
//        description: "Look through the Nicodemus root dictionary and search for words in English or Nicodemus",
//        pathImage: "images/edit2.png",
//        heightImage: 140,
//        widthImage: 140,
//        backgroundColor: Color.fromRGBO(78, 46, 114, .7),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Stem and Affix Lists",
//        pathImage: "images/clipboard.png",
//        heightImage: 140,
//        widthImage: 140,
//        description: "This app includes the Nicodemus Stem and Affix Lists",
//        backgroundColor: Color.fromRGBO(78, 46, 114, .9),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "Learn or Practice Nicodemus",
//        pathImage: "images/quiz.png",
//        heightImage: 140,
//        widthImage: 140,
//        description: "Learn Nicodemus by participating in our learning activies",
//        backgroundColor: Color.fromRGBO(252, 11,106,.8),
//      ),
//    );
//
//  }
//
//  void onDonePress(){
//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) => Home()
//        ));
//  }
//  void onSkipPress(){
//    //go to next screen
//    Navigator.push(context,
//        MaterialPageRoute(
//            builder: (context) => Home()
//        ));
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return new IntroSlider(slides:
//    this.slides,
//      onDonePress: this.onDonePress,
//      onSkipPress: this.onSkipPress,
//    );
//  }
//
//
//
//
//
//}
