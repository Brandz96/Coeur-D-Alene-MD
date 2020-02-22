import 'package:demo_app/AffixSecondScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'TilesNotes.dart';
import 'TempDelayClass.dart';

class AffixPage extends StatefulWidget {
  AffixPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor})
      : super(key: key);

  static const String routeName = "/Affix";
  Color backGroundColor;
  Color tileBackGroundColor;

  final String title;

  @override
  _AffixPageState createState() =>
      new _AffixPageState(backGroundColor, tileBackGroundColor);
}

class _AffixPageState extends State<AffixPage> {
  List<AffixNote> _notes = List<AffixNote>();
  List<AffixNote> _fnotes = List<AffixNote>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;

  _AffixPageState(this.backGroundColor, this.tileBackGroundColor);

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AffixSecondScreen(
                                  affix: _fnotes[index].affix,
                                  backGroundColor: backGroundColor,
                                  tileBackGroundColor: tileBackGroundColor,
                                )));
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
    );
  }
}
