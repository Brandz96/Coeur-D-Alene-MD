import 'package:demo_app/StemSecondScreen.dart';
import 'package:flutter/material.dart';
import 'HomePageClone.dart';
import 'TilesNotes.dart';
import 'TempDelayClass.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';
import 'package:demo_app/HomePage.dart';
import 'main.dart';

class StemPage extends StatefulWidget {
  StemPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage})
      : super(key: key);

  static const String routeName = "/StemPage";

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  @override
  _StemPageState createState() =>
      _StemPageState(backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _StemPageState extends State<StemPage> {
  List<StemNote> _notes = List<StemNote>();
  List<StemNote> _fnotes = List<StemNote>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  _StemPageState(this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage);

//  Future<List<StemNote>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/StemList.json';
//    var response = await http.get(url);
//
//    var notes = List<StemNote>();
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//
//        notes.add(StemNote.fromJson(noteJson));
//      }
//    }
//    return notes;
//  }

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
        body: CustomPaint(
          painter: BluePainter(backGroundColor, counterFromPreviousPage),
          child: Column(
            children: <Widget>[
              TextField(
                  style: TextStyle(color: tileBackGroundColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: 'Search Stem',
                    fillColor: Colors.white,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 15),
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
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(new PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => new StemSecondScreen(stem: _fnotes[index].stem,backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor, counterFromPreviousPage: counterFromPreviousPage,),
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
                                Padding(
                                  child: Text(
                                    _fnotes[index].stem,
                                    textAlign: TextAlign.center,
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
