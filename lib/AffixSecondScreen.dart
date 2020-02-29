import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'TilesNotes.dart';
import 'AffixPage.dart';

class AffixSecondScreen extends StatefulWidget {
  final String title;
  final String text;
  final String affix;
  final List<Note> fnotes;
  Color backGroundColor;
  Color tileBackGroundColor;

  AffixSecondScreen(
      {Key key,
      this.title,
      this.affix,
      this.fnotes,
      this.text,
      this.backGroundColor,
      this.tileBackGroundColor})
      : super(key: key);

  //_AffixSecondScreenState
  @override
  _AffixSecondScreenState createState() => _AffixSecondScreenState(
      affix, this.backGroundColor, this.tileBackGroundColor);
}

class _AffixSecondScreenState extends State<AffixSecondScreen> {
  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();
  Color backGroundColor;
  Color tileBackGroundColor;

  final String affix;

  _AffixSecondScreenState(
      this.affix, this.backGroundColor, this.tileBackGroundColor);

//  Future<List<Note>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/affixList.json';
//    var response = await http.get(url);
//
//    var notes = List<Note>();
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//        if (noteJson['affix'] == affix) {
//          notes.add(Note.fromJson(noteJson));
//        }
//      }
//    }
//    return notes;
//  }
  Future<List<Note>> loadJSON() async {
    var notes2 = List<Note>();
    var link = 'assets/affixList.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      if (n['affix'] == affix) {
        notes2.add(Note.fromJson(n));
      }
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
    print(affix);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          // Navigator.push(context, MaterialPageRoute(builder: (context) => Home())),
          onTap: () {
            Navigator.of(context).pushReplacement(new PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    new AffixPage(
                        backGroundColor: backGroundColor,
                        tileBackGroundColor: tileBackGroundColor),
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
          padding: EdgeInsets.all(40),
        ),
        backgroundColor: backGroundColor,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              affix,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return new Container(
                  height: 90,
                  decoration: new BoxDecoration(
                    color: (index % 2 == 0)
                        ? tileBackGroundColor
                        : tileBackGroundColor,
                    borderRadius: new BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      top: 15.0, bottom: 25.0, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          _fnotes[index].title,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        child: Text(
                          _fnotes[index].text,
                          style: TextStyle(
                              color: Color.fromRGBO(238, 239, 240, 1),
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                        padding: EdgeInsets.only(left: 10),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
