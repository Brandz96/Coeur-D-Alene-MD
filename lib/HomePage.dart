import 'package:flutter/material.dart';

import 'AboutPage.dart';
import 'AffixPage.dart';
import 'FeedBackPage.dart';
import 'RootDictionaryPage.dart';
import 'StemPage.dart';
import 'TextPage.dart';

class Home extends StatefulWidget {
  Home({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int counter = 0;

  //Color homeBackGroundColor = Color.fromRGBO(192, 192, 192, 1);
  //Color homeBackGroundColor = Color.fromRGBO(34, 28, 27, 1);
  Color homeBackGroundColor = Color.fromRGBO(28, 28, 30, 1);
  Color buttonColors = Color.fromRGBO(50, 66, 127, 1);
  Color iconColor = Colors.black;
  Color rootDictionaryBackGroundColor = Color.fromRGBO(28, 28, 30, 1); //blue
  Color titleColor = Colors.white70;
  Color circularFrame = Color.fromRGBO(44, 44, 46, 1);

  @override
  Widget build(BuildContext context) {
    print(homeBackGroundColor.toString()); //ff1 = blue
    print(buttonColors.toString()); //ffaa = grey

    return Scaffold(
      backgroundColor: homeBackGroundColor,
      body: CustomPaint(
        painter: BluePainter(homeBackGroundColor, counter),
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
                      margin: EdgeInsets.only(top: 50),
                      child: Text(
                        'Coeur D\'Alene',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                            color: titleColor,
                            fontFamily: "Open Sans"),
                      ),
                    ),
                    //SizedBox(height: 2.0, ),
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
            Expanded(
              child: new Center(
                child: Container(
                  decoration: BoxDecoration(
                    //color: Color.fromRGBO(60,  60,  60, 1),
                    color: circularFrame,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      RaisedButton(
                          color: getColor(),
                          elevation: 3,
                          onPressed: () {
                            HomePageToRootDictionaryPageTransition(context);
                          },
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(0),
                          child: Ink(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
                                alignment: Alignment.center,
                                child: Text(
                                  "Root Dictionary",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    color: titleColor,
                                  ),
                                ),
                              ))),
                      new Padding(padding: EdgeInsets.only(top: 10)),
                      RaisedButton(
                          color: getColor(),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
                                alignment: Alignment.center,
                                child: Text(
                                  "Stem List",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    color: titleColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ))),
                      new Padding(padding: EdgeInsets.only(top: 10)),
                      RaisedButton(
                          color: getColor(),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
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
                          color: getColor(),
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
                                alignment: Alignment.center,
                                child: Text(
                                  "Text Files",
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    color: titleColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ))),
                      new Padding(padding: EdgeInsets.only(top: 10)),
                      RaisedButton(
                          color: getColor(),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
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
                          color: getColor(),
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
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              child: Container(
                                width: 250,
                                height: 20,
                                constraints: const BoxConstraints(
                                    minWidth: 40, minHeight: 40),
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
                              if (counter % 2 == 0 || counter == 0) {
                                homeBackGroundColor =
                                // Color.fromRGBO(192, 192, 192, 1);
                                //Color.fromRGBO(138,37,41, 1);
                                Color.fromRGBO(28, 28, 30, 1);


                                setColor(counter);
                                //buttonColors = Colors.white;
                                //buttonColors = Color.fromRGBO(50,50,50, 1);
                                buttonColors = Color.fromRGBO(50, 66, 127, 1);
                                //titleColor = Color.fromRGBO(79, 87, 95, 1);
                                titleColor = Colors.white70;
                                circularFrame = Color.fromRGBO(44, 44, 46, 1);
                              } else {
                                homeBackGroundColor =
                                // Color.fromRGBO(34, 28, 27, 1);
                                Color.fromRGBO(192, 192, 192, 1);

                                setColor(counter);
                                // buttonColors = Color.fromRGBO(50, 66, 127, 1);
                                // buttonColors = Color.fromRGBO(50,50,50, 1);
                                buttonColors = Colors.white;
                                titleColor = Color.fromRGBO(79, 87, 95, 1);
                                circularFrame =
                                    Color.fromRGBO(174, 174, 178, 1);
                              }
                            });

                            print(counter);
                          },
                          child: new Icon(Icons.brightness_2,
                              color: titleColor, size: 20.0),
                          shape: new CircleBorder(),
                          fillColor: homeBackGroundColor,
                          padding: const EdgeInsets.all(15.0),
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
    );
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void setColor(int n) {
    if (n % 2 == 0) {
      buttonColors = Color.fromRGBO(50, 66, 127, 1);
      iconColor = Colors.black;
      rootDictionaryBackGroundColor = Color.fromRGBO(34, 28, 27, 1); //blue
      titleColor = Colors.white;
      circularFrame = Color.fromRGBO(44, 44, 46, 1);
    } else {
      buttonColors = Color.fromRGBO(50, 50, 50, 1);
      iconColor = Colors.grey;
      rootDictionaryBackGroundColor = Color.fromRGBO(192, 192, 192, 1); //black
      titleColor = Colors.grey;
      circularFrame = Color.fromRGBO(174, 174, 178, 1);
    }
  }

  Color getColor() {
    return buttonColors;
  }

  // ignore: non_constant_identifier_names
  void HomePageToRootDictionaryPageTransition(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new RootDictionaryPage(
          backGroundColor: rootDictionaryBackGroundColor,
          tileBackGroundColor: buttonColors,
          counterFromPreviousPage: counter,
          titleColor: titleColor,
          circularFrame: circularFrame,
        ),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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

  // ignore: non_constant_identifier_names
  void HomePageToStemPageTransition(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new StemPage(
          backGroundColor: rootDictionaryBackGroundColor,
          tileBackGroundColor: buttonColors,
          counterFromPreviousPage: counter,
          titleColor: titleColor,
          circularFrame: circularFrame,
        ),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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

  // ignore: non_constant_identifier_names
  void HomePageToAffixPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new AffixPage(
          backGroundColor: rootDictionaryBackGroundColor,
          tileBackGroundColor: buttonColors,
          counterFromPreviousPage: counter,
          titlecolor: titleColor,
          circularFrame: circularFrame,
        ),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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

  // ignore: non_constant_identifier_names
  void HomePageToAudioPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new AudioPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors,
            counterFromPreviousPage: counter,
          titleColor: titleColor,
          circularFrame: circularFrame,),

        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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

  // ignore: non_constant_identifier_names
  void HomePageToAboutPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new AboutPage(
          backGroundColor: rootDictionaryBackGroundColor,
          tileBackGroundColor: buttonColors,
          counterFromPreviousPage: counter,
          titlecolor: titleColor,
          circularFrame: circularFrame,
        ),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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

  // ignore: non_constant_identifier_names
  void HomePageToFeedBackPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new FeedBackPage(
          backGroundColor: rootDictionaryBackGroundColor,
          tileBackGroundColor: buttonColors,
          counterFromPreviousPage: counter,
          titleColor: titleColor,
          circularFrame: circularFrame,
        ),
        maintainState: true,
        opaque: true,
        transitionDuration: Duration(milliseconds: 600),
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
}

class BluePainter extends CustomPainter {
  Color passedBackgroundColor;
  int counter;
  BluePainter(this.passedBackgroundColor, this.counter);

  Color pickColor(int counter) {
    if (counter % 2 == 0 || counter == 0) {
      return Color.fromRGBO(79, 87, 95, 1);
      //rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);
      // ButtonColors = Color.fromRGBO(187, 134, 252, 1);
    } else {
      return Color.fromRGBO(128, 128, 128, .3);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    // Path mainBackground = Path();
//  mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
//    paint.color = Colors.blue.shade700;
//    canvas.drawPath(mainBackground, paint);

    //Path ovalPath = Path();
    // ovalPath.moveTo(0, height * 0.2);
    // ovalPath.quadraticBezierTo(
    // width * 0.45, height * 0.25, width * 0.5, height * 0.5);
    //ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
    // ovalPath.lineTo(0, height);
    //paint.color = pickColor(counter);
    //canvas.drawRect(new Rect.fromLTRB(300, 30, 450, 230), paint);

    // canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
