import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';
import 'HomePage.dart';
import 'package:demo_app/HomePageClone.dart';

class AudioPage extends StatefulWidget {
  AudioPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage})
      : super(key: key);

  static const String routeName = "/Audio";

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  @override
  _AudioPageState createState() =>
      _AudioPageState(backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _AudioPageState extends State<AudioPage> {
  List<Link> _notes = List<Link>();
  List<Link> _fnotes = List<Link>();
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

//  Future<List<Link>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Audio.json';
//    var response = await http.get(url);
//
//    var notes = List<Link>();
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//
//        notes.add(Link.fromJson(noteJson));
//      }
//    }
//    return notes;
//  }

  _AudioPageState(this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage);

  Future<List<Link>> loadJSON() async {
    var notes2 = List<Link>();
    var link = 'assets/Link.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      notes2.add(Link.fromJson(n));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
          onTap: () {
            Navigator.of(context).pushReplacement(new PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                new HomePageClone(backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor, counterFromPreviousPage: counterFromPreviousPage,),
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
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Text Files',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return new GestureDetector(
                  onDoubleTap: () {
                    launch(_fnotes[index].web);
                  },
                  child: Container(
                    height: 90,
                    decoration: new BoxDecoration(
                        color: tileBackGroundColor,
                        borderRadius: new BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.white,
                        )),
                    margin: const EdgeInsets.only(
                        top: 15.0, bottom: 25.0, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              child: Text(
                                _fnotes[index].title,
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              padding: EdgeInsets.only(left: 10),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6, top: 1),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
      backgroundColor: backGroundColor,
    );
  }
}

class Link {
  String title;
  String web;

  Link(this.title, this.web);

  Link.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    web = json['link'];
  }
}
