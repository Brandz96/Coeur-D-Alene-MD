import 'dart:async';
import 'dart:convert';

import 'package:demo_app/HomePage.dart';
import 'package:demo_app/StemSecondScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';

import 'AffixPage.dart';
import 'HomePageClone.dart';
import 'RootDictionaryPage.dart';
import 'TempDelayClass.dart';
import 'TilesNotes.dart';

// ignore: must_be_immutable
class StemPage extends StatefulWidget {
  StemPage({Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage,
    this.titleColor, this.circularFrame})
      : super(key: key);

  static const String routeName = "/StemPage";

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;
  Color circularFrame;

  @override
  _StemPageState createState() =>
      _StemPageState(
          backGroundColor, tileBackGroundColor, counterFromPreviousPage,
          titleColor, circularFrame);
}

class _StemPageState extends State<StemPage> {
  List<StemNote> _notes = List<StemNote>();
  List<StemNote> _fnotes = List<StemNote>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;
  Color circularFrame;

  _StemPageState(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage,
      this.titleColor, this.circularFrame);


  Future<List<StemNote>> loadJSON() async {
    var notes2 = List<StemNote>();
    var link = 'assets/StemList.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      notes2.add(StemNote.fromJson(n));
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
          titleColor: titleColor,
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
              titleColor: titleColor,
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
              titleColor: titleColor,
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
              titleColor: titleColor,
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
      if (_selectedIndex == 3) {
        Navigator.of(context).pushReplacement(new PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
            new AffixPage(
              backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titlecolor: titleColor,
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
    });
  }

  Color iconColor;

  Color setIconColor(int n){
    if(n % 2 == 0 || n == 0){
      iconColor = tileBackGroundColor;
      return iconColor;
    } else {
      iconColor = titleColor;
      return iconColor;
    }
  }


  @override
  Widget build(BuildContext context) {
    print(counterFromPreviousPage);

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
            },
            child: Icon(
              Icons.arrow_back,
              color: titleColor,
            ),
          ),
          title: new Padding(
            child: new Text(
              'Coeur D\' Alene Mobile Dictionary',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: titleColor,
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
                    color: titleColor,
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
                  color: titleColor,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.archive,

                color: setIconColor(counterFromPreviousPage),),
              title: Text(
                'Stem',
                style: TextStyle(
                  color: titleColor,
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
                  color: titleColor,
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
              TextField(
                  style: TextStyle(color: titleColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Search Stem',
                    fillColor: titleColor,
                    hintStyle: TextStyle(color: titleColor, fontSize: 15),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: titleColor),
                    ),
                  ),
                  onChanged: (string) {
                    _delay.run(() {
                      setState(() {
                        _fnotes = _notes
                            .where((u) => (u.stem
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                            .toList();
                      });
                      //
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Reichard's Stem List",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 22,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onDoubleTap: () {
                        Share.share('Reichard Stem:' + _fnotes[index].stem);
                      },
                      onTap: () {
                        Navigator.of(context).pushReplacement(new PageRouteBuilder(
                            pageBuilder: (context, animation,
                                secondaryAnimation) =>
                            new StemSecondScreen(stem: _fnotes[index].stem,
                                backGroundColor: backGroundColor,
                                tileBackGroundColor: tileBackGroundColor,
                                counterFromPreviousPage: counterFromPreviousPage,
                                titleColor: titleColor,
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
                        height: 70,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    child: Text(
                                      _fnotes[index].stem,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: titleColor,
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
                                    color: titleColor,
                                  ),
                                )
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
