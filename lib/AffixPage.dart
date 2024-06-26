import 'dart:async';
import 'dart:convert';

import 'package:demo_app/AffixSecondScreen.dart';
import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'HomePage.dart';
import 'RootDictionaryPage.dart';
import 'StemPage.dart';
import 'TilesNotes.dart';


// ignore: must_be_immutable
class AffixPage extends StatefulWidget {
  AffixPage({Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage,
    this.titlecolor, this.circularFrame})
      : super(key: key);

  static const String routeName = "/Affix";
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titlecolor;
  Color circularFrame;

  final String title;

  @override
  _AffixPageState createState() =>
      new _AffixPageState(
          backGroundColor, tileBackGroundColor, counterFromPreviousPage,
          titlecolor, circularFrame);
}

class _AffixPageState extends State<AffixPage> {
  List<AffixNote> _notes = List<AffixNote>();
  List<AffixNote> _fnotes = List<AffixNote>();

  //final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titlecolor;
  Color circularFrame;

  _AffixPageState(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage, this.titlecolor, this.circularFrame);


  Future<List<AffixNote>> loadJSON() async {
    var notes2 = List<AffixNote>();
    var link = 'assets/affix.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      notes2.add(AffixNote.fromJson(n));
    }
    print(2);
    return notes2;
  }

  @override
  void initState() {
    loadJSON().then((value) {
      setState(() {
        _notes.addAll(value);
        _fnotes.addAll(value);
      });
    });
    super.initState();
  }

  // ignore: missing_return
  Future<bool> _onBackPressed(){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new HomePageClone(backGroundColor: backGroundColor,
          tileBackGroundColor: tileBackGroundColor,
          counterFromPreviousPage: counterFromPreviousPage,
          titleColor: titlecolor,
          circularFrame: circularFrame,),
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

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Index' + _selectedIndex.toString());

      if (_selectedIndex == 0) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new HomePageClone(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titleColor: titlecolor,
              circularFrame: circularFrame,),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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

      if (_selectedIndex == 1) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new RootDictionaryPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titleColor: titlecolor,
              circularFrame: circularFrame,),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
      if (_selectedIndex == 2) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new StemPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
                titleColor: titlecolor,
                circularFrame: circularFrame),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
      if (_selectedIndex == 3) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new AffixPage(
                backGroundColor: backGroundColor,
                tileBackGroundColor: tileBackGroundColor,
                counterFromPreviousPage: counterFromPreviousPage,
                titlecolor: titlecolor,
                circularFrame: circularFrame),
            maintainState: true,
            opaque: true,
            transitionDuration: Duration(milliseconds: 600),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
    });
  }

  Color iconColor;

  Color setIconColor(int n){
    if(n % 2 == 0 || n == 0){
      iconColor = tileBackGroundColor;

      return iconColor;
    } else {
      iconColor = titlecolor;
      return iconColor;
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
            onTap: () {
              Navigator.of(context).pushReplacement(new PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                  new HomePageClone(backGroundColor: backGroundColor,
                    tileBackGroundColor: tileBackGroundColor,
                    counterFromPreviousPage: counterFromPreviousPage,
                    titleColor: titlecolor,
                    circularFrame: circularFrame,),
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
            },
            child: Icon(
              Icons.arrow_back,
              color: titlecolor,
            ),
          ),
          title: new Padding(
            child: new Text(
              'Coeur D\' Alene Mobile Dictionary',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: titlecolor,
                fontSize: 10,
              ),
            ),
            padding: EdgeInsets.all(0),
          ),
          backgroundColor: backGroundColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: backGroundColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  color: setIconColor(counterFromPreviousPage),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: titlecolor,
                  ),
                ),
                backgroundColor: backGroundColor),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.translate,
                color: setIconColor(counterFromPreviousPage),
              ),
              title: Text(
                'Root',
                style: TextStyle(
                  color: titlecolor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.archive,
                color: setIconColor(counterFromPreviousPage),
              ),
              title: Text(
                'Stem',
                style: TextStyle(
                  color: titlecolor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.assignment,
                color: setIconColor(counterFromPreviousPage),
              ),
              title: Text(
                'Affix',
                style: TextStyle(
                  color: titlecolor,
                ),
              ),
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),

        body: CustomPaint(
          painter: BluePainter(backGroundColor, counterFromPreviousPage),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Reichard's Affix List",
                  style: TextStyle(
                    color: titlecolor,
                    fontSize: 22,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(new PageRouteBuilder(
                            pageBuilder: (context, animation,
                                secondaryAnimation) =>
                            new AffixSecondScreen(
                              affix: _fnotes[index].affix,
                              backGroundColor: backGroundColor,
                              tileBackGroundColor: tileBackGroundColor,
                              counterFromPreviousPage: counterFromPreviousPage,
                                titleColor: titlecolor,
                                circularFrame: circularFrame),
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
                      },
                      child: new Container(
                        height: 90,
                        decoration: new BoxDecoration(
                            color: (index % 2 == 0)
                                ? tileBackGroundColor
                                : tileBackGroundColor,
                            borderRadius: new BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.white,
                            )),
                        margin: const EdgeInsets.only(
                            top: 25.0, bottom: 25.0, left: 10.0, right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    child: Text(
                                      _fnotes[index].affix,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: titlecolor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 10),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 3),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: titlecolor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    );
                  },
                  itemCount: _fnotes.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: backGroundColor,
      ),
    );
  }
}
