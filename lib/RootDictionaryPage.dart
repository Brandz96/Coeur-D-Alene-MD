import 'dart:async';
import 'dart:convert';

import 'package:demo_app/AffixPage.dart';
import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:share/share.dart';

import 'HomePage.dart';
import 'RootSecondScreen.dart';
import 'StemPage.dart';
import 'TempDelayClass.dart';
import 'TilesNotes.dart';

// ignore: must_be_immutable
class RootDictionaryPage extends StatefulWidget {
  static const String routeName = "/RootDictionaryPage";
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;
  Color circularFrame;
  final String title;

  RootDictionaryPage({Key key,
    this.title,
    this.backGroundColor,
    this.tileBackGroundColor,
    this.counterFromPreviousPage,
    this.titleColor, this.circularFrame})
      : super(key: key);

  @override
  _RootDictionaryPageState createState() => _RootDictionaryPageState(
      backGroundColor, tileBackGroundColor, counterFromPreviousPage,
      titleColor, circularFrame);
}

class _RootDictionaryPageState extends State<RootDictionaryPage> {
  int rvalue1;
  int flag1;

  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();

  // List<Note> _local = List<Note>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;
  Color circularFrame;

  _RootDictionaryPageState(this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage, this.titleColor, this.circularFrame);

  Future<String> loadAssets() async {
    return await rootBundle.loadString(
        'D:/Users/Brand/AndroidStudioProjects/demo/demo_app/assets/salish.json');
  }

  Future<List<Note>> loadJSON() async {
    var notes2 = List<Note>();
    var link = 'assets/salish.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      notes2.add(Note.fromJson(n));
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
        rvalue1 = 0;
        flag1 = 0;
      });
    });
//    loadJSON().then((value){
//      setState((){
//        _local.addAll(value);
//      });
//    });
    super.initState();
  }

  rValue(int val) {
    setState(() {
      rvalue1 = val;
      if (rvalue1 == 1) {
        flag1 = 1;
      } else if (rvalue1 == 2) {
        flag1 = 2;
      } else {
        flag1 = 0;
      }
    });
  }

  // ignore: missing_return
  Future<bool> _onBackPressed() {
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new HomePageClone(
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
          var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        }));
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
    print(backGroundColor.toString());
    print(tileBackGroundColor.toString());
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
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  }));
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
                      color: titleColor
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
                color: setIconColor(counterFromPreviousPage),
              ),
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
                    hintText: 'Search Word',
                    fillColor: titleColor,
                    hintStyle: TextStyle(color: titleColor, fontSize: 15),
                    enabledBorder: new UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: tileBackGroundColor),
                    ),
                  ),
                  onChanged: (string) {
                    _delay.run(() {
                      setState(() {
                        if (flag1 == 1) {
                          _fnotes = _notes
                              .where((u) => (u.title
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                              .toList();
                        } else if (flag1 == 2) {
                          _fnotes = _notes
                              .where((u) => (u.text
                              .toLowerCase()
                              .contains(string.toLowerCase())))
                              .toList();
                        } else {
                          _fnotes = _notes
                              .where((u) => (u.title
                              .toLowerCase()
                              .contains(string.toLowerCase()) ||
                              u.text
                                  .toLowerCase()
                                  .contains(string.toLowerCase())))
                              .toList();
                        }
                      });
                      //0
                    });
                  }),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 1,
                    groupValue: rvalue1,
                    activeColor: titleColor,
                    onChanged: (val) {
                      rValue(val);
                    },
                  ),
                  new Text(
                    'Nicodemus',
                    style: TextStyle(
                      fontSize: 12,
                      color: titleColor,
                    ),
                  ),
                  new Radio(
                      value: 2,
                      groupValue: rvalue1,
                      activeColor: titleColor,
                      onChanged: (val) {
                        rValue(val);
                      }),
                  new Text(
                    'English',
                    style: TextStyle(fontSize: 12, color: titleColor),
                  ),
                ],
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onDoubleTap: () {
                        Share.share('Nicodemus: ' + _fnotes[index].title +
                            '\nEnglish: ' + _fnotes[index].text);
                      },
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            new PageRouteBuilder(
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                new RootSecondScreen(
                                  root: _fnotes[index].root,
                                  backGroundColor: backGroundColor,
                                  tileBackGroundColor: tileBackGroundColor,
                                  counterFromPreviousPage:
                                  counterFromPreviousPage,
                                  titleColor: titleColor,
                                  circularFrame: circularFrame,
                                ),
                                maintainState: true,
                                opaque: true,
                                transitionDuration: Duration(milliseconds: 600),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
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
                      child: new Container(
                        height: 130,
                        decoration: new BoxDecoration(
                            color: (index % 2 == 0)
                                ? tileBackGroundColor
                                : tileBackGroundColor,
                            borderRadius:
                            new BorderRadius.all(Radius.circular(20)),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.white,
                            )),
                        margin: const EdgeInsets.only(
                            top: 15.0, bottom: 25.0, left: 10.0, right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      _fnotes[index].title,
                                      style: TextStyle(
                                          fontSize: 21,
                                          color: titleColor,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, top: 3),
                                  child: Icon(
                                    Icons.chevron_right,
                                    color: titleColor,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              child: Text(
                                _fnotes[index].text,
                                style: TextStyle(
                                    color: titleColor,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 11),
                              ),
                              padding: EdgeInsets.only(left: 10, bottom: 2),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
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
