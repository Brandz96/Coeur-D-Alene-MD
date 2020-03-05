import 'package:demo_app/AffixSecondScreen.dart';
import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'TilesNotes.dart';
import 'TempDelayClass.dart';
import 'HomePage.dart';
import 'package:demo_app/HomePageClone.dart';

class AffixPage extends StatefulWidget {
  AffixPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage})
      : super(key: key);

  static const String routeName = "/Affix";
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  final String title;

  @override
  _AffixPageState createState() =>
      new _AffixPageState(backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _AffixPageState extends State<AffixPage> {
  List<AffixNote> _notes = List<AffixNote>();
  List<AffixNote> _fnotes = List<AffixNote>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  _AffixPageState(this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage);

//  Future<List<AffixNote>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/affix.json';
//    var response = await http.get(url);
//
//    var notes = List<AffixNote>();
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//
//        notes.add(AffixNote.fromJson(noteJson));
//      }
//    }
//    return notes;
//  }
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

  Future<bool> _onBackPressed(){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => new HomePageClone(backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor, counterFromPreviousPage: counterFromPreviousPage),
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
                  pageBuilder: (context, animation, secondaryAnimation) => new HomePageClone(backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor, counterFromPreviousPage: counterFromPreviousPage),
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
            ),
          ),
          title: new Padding(
            child: new Text(
              'Coeur D\' Alene Mobile Dictionary',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
              ),
            ),
            padding: EdgeInsets.all(0),
          ),
          backgroundColor: backGroundColor,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Reichard's Affix List",
                style: TextStyle(
                  color: Colors.white,
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
                          pageBuilder: (context, animation, secondaryAnimation) => new AffixSecondScreen(affix: _fnotes[index].affix,backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor),
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
                              Padding(
                                child: Text(
                                  _fnotes[index].affix,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, top: 3),
                                child: Icon(
                                  Icons.chevron_right,
                                  color: Colors.white,
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
        backgroundColor: backGroundColor,
      ),
    );
  }
}
