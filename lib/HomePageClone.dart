import 'package:demo_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'RootDictionaryPage.dart';
import 'AboutPage.dart';
import 'StemPage.dart';
import 'AudioPage.dart';
import 'AffixPage.dart';
import 'FeedBackPage.dart';


// ignore: must_be_immutable
class HomePageClone extends StatefulWidget {
  HomePageClone(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage
        , this.titleColor}) : super(key: key);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;



  final String title;

  @override
  _HomePageClone createState() =>
      _HomePageClone(
          backGroundColor, tileBackGroundColor, counterFromPreviousPage,
          titleColor);
}

class _HomePageClone extends State<HomePageClone> {
  Color backGroundColor;
  Color tileBackGroundColor;
  int counter = 0;
  int counterFromPreviousPage;
  Color homeBackGroundColor = Color.fromRGBO(220, 236, 247, 1); //blue
  Color buttonColors = Colors.white; //grey
  Color iconColor;
  Color rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
  Color homeTitleColor = Colors.white30;
  Color titleColor;

  _HomePageClone(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage,
      this.titleColor);



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: backGroundColor,
      body: CustomPaint(
        painter: BluePainter(backGroundColor, counterFromPreviousPage),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 300.0,
                        margin: EdgeInsets.only(top: 70),
                        child: Text(
                          'Coeur D\' Alene',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                              color: titleColor,
                              fontFamily: "Open Sans"),
                        ),
                      ),
                      SizedBox(height: 2.0),
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
            new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      onPressed: () {
                        HomePageToRootDictionaryPageTransition(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "Root Dictionary",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Open Sans',
                                  color: titleColor),
                            ),
                          ))),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      onPressed: () {
                        HomePageToStemPageTransition(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "Stem List",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Open Sans',
                                  color: titleColor),
                            ),
                          ))),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      onPressed: () {
                        HomePageToAffixPage(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "Affix List",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: titleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      onPressed: () {
                        HomePageToAudioPage(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "Text Files", style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: titleColor,
                            ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      onPressed: () {
                        HomePageToAboutPage(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "About",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: titleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                  new Padding(padding: EdgeInsets.only(top: 10)),
                  RaisedButton(
                      color: tileBackGroundColor,
                      elevation: 3,
                      splashColor: Colors.grey,
                      animationDuration: Duration(seconds: 2),
                      onPressed: () {
                        HomePageToFeedBackPage(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Container(
                            width: 250,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: Text(
                              "Provide Feedback",
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                color: titleColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                  Padding(
                      padding: EdgeInsets.only(top: 15),
//                      child: IconButton(
//                          icon: Icon(Icons.brightness_2),
//                          color: iconColor,
//                          iconSize: 20,
                      child: new RawMaterialButton(
                          onPressed: () {
                            _incrementCounter();
                            setState(() {
                              if (counterFromPreviousPage % 2 == 0 || counterFromPreviousPage == 0) {
                                homeBackGroundColor =
                                    Color.fromRGBO(220, 236, 247, 1);

                                setColor(counterFromPreviousPage);
                                buttonColors = Colors.white;
                                homeTitleColor = Color.fromRGBO(79, 87, 95, 1);
                              } else {
                                homeBackGroundColor =
                                    Color.fromRGBO(34, 28, 27, 1);

                                setColor(counterFromPreviousPage);
                                buttonColors = Color.fromRGBO(50, 66, 127, 1);
                                homeTitleColor = Colors.white70;
                              }
                            });

                            print(counterFromPreviousPage);
                          },
                    child: new Icon(
                    Icons.brightness_2,
                        color: titleColor,
                    size: 20.0
                  ),
              shape: new CircleBorder(),
              fillColor: backGroundColor,
              padding: const EdgeInsets.all(15.0),
            ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Purdue Fort Wayne Capstone Project',
                      style: TextStyle(
                        fontSize: 9,
                        color: titleColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      counterFromPreviousPage++;
    });
  }



  void setColor(int n) {
    if (n % 2 == 0) {
      buttonColors = Colors.white; //grey
      iconColor = Colors.black;
      rootDictionaryBackGroundColor = Color.fromRGBO(220, 236, 247, 1); //blue
      homeTitleColor = Color.fromRGBO(79, 87, 95, 1);
      backGroundColor = homeBackGroundColor;
      tileBackGroundColor = buttonColors;
      titleColor = homeTitleColor;
    } else {
      buttonColors = Color.fromRGBO(50, 66, 127, 1); //purple
      iconColor = Colors.white;
      rootDictionaryBackGroundColor = Color.fromRGBO(34, 28, 27, 1);//black
      homeTitleColor = Colors.white70;
      backGroundColor = homeBackGroundColor;
      tileBackGroundColor = buttonColors;
      titleColor = homeTitleColor;
    }
  }

  Color getColor() {
    return buttonColors;
  }


  // ignore: non_constant_identifier_names
  void HomePageToRootDictionaryPageTransition(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new RootDictionaryPage(
            backGroundColor: backGroundColor,
          tileBackGroundColor: tileBackGroundColor,
          counterFromPreviousPage: counterFromPreviousPage,
          titleColor: titleColor,),
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

  // ignore: non_constant_identifier_names
  void HomePageToStemPageTransition(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new StemPage(
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor,
            counterFromPreviousPage: counterFromPreviousPage,
            titleColor: titleColor),
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

  // ignore: non_constant_identifier_names
  void HomePageToAffixPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AffixPage(
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor,
            counterFromPreviousPage: counterFromPreviousPage,
            titlecolor: titleColor),
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

  // ignore: non_constant_identifier_names
  void HomePageToAudioPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AudioPage(
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor,
            counterFromPreviousPage: counterFromPreviousPage,
            titleColor: titleColor),
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

  // ignore: non_constant_identifier_names
  void HomePageToAboutPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AboutPage(
            backGroundColor: backGroundColor,
          tileBackGroundColor: tileBackGroundColor,
          counterFromPreviousPage: counterFromPreviousPage,
          titlecolor: titleColor,),
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

  // ignore: non_constant_identifier_names
  void HomePageToFeedBackPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new FeedBackPage(
            backGroundColor: backGroundColor,
            tileBackGroundColor: tileBackGroundColor,
            counterFromPreviousPage: counterFromPreviousPage,
            titleColor: titleColor),
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
