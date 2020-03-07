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
  Color buttonColors = Color.fromRGBO(170, 184, 194, .9);//grey
  Color iconColor = Colors.black;
  Color rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
  Color titleColor = Colors.white;



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
                      color: getColor(),
                      elevation: 10,
                      onPressed: () {
                        HomePageToRootDictionaryPageTransition(context);
                      },
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.white, width: 1.0)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50),),
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
                              style: TextStyle(fontFamily: 'Open Sans',
                                color: Colors.white,
                              ),
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
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white, width: 1.0)),
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
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white, width: 1.0)),
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
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white, width: 1.0)),
                      padding: const EdgeInsets.all(0),
                      child: Ink(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50),),
                          ),
                          child: Container(
                            width: 350,
                            height: 20,
                            constraints:
                            const BoxConstraints(minWidth: 40, minHeight: 40),
                            alignment: Alignment.center,
                            child: const Text(
                              "Text Files",
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
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white, width: 1.0)),
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
                          borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.white, width: 1.0)),
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
                      },
                      child: new Icon(
                          Icons.brightness_2,
                          color: iconColor,
                          size: 20.0
                      ),
                      shape: new CircleBorder(),
                      fillColor: homeBackGroundColor,
                      padding: const EdgeInsets.all(15.0),
                    ),
                  ),
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
      buttonColors = Color.fromRGBO(170, 184, 194, .9);//grey
      iconColor = Colors.black;
      rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);//blue
      titleColor = Colors.white;
    } else {
      buttonColors = Color.fromRGBO(187, 134, 252, .9);//purple
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

  void HomePageToAffixPage(context) {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AffixPage(
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

  void HomePageToAudioPage(context){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation,
            secondaryAnimation) => new AudioPage(
            backGroundColor: rootDictionaryBackGroundColor,
            tileBackGroundColor: buttonColors, counterFromPreviousPage: counter,),
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
            tileBackGroundColor: buttonColors, counterFromPreviousPage: counter,),
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
            tileBackGroundColor: buttonColors, counterFromPreviousPage: counter,),
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
class BluePainter extends CustomPainter {

  Color passedBackgroundColor;
  int counter;
  BluePainter(this.passedBackgroundColor, this.counter);

  Color pickColor(int counter){
    if(counter % 2 == 0 || counter == 0){
      return Colors.blue.shade600;
          //rootDictionaryBackGroundColor = Color.fromRGBO(29, 161, 242, 1);
          //buttonColors = Color.fromRGBO(187, 134, 252, 1);
    } else {
      return Color.fromRGBO(187, 134, 252, .2);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

//    Path mainBackground = Path();
//    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
//    paint.color = Colors.blue.shade700;
//    canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    ovalPath.moveTo(0, height * 0.2);
    ovalPath.quadraticBezierTo(width * 0.45, height * 0.25, width * 0.5, height * 0.5);
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.1, height);
    ovalPath.lineTo(0, height);

    paint.color = pickColor(counter);
    canvas.drawPath(ovalPath, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }


}
