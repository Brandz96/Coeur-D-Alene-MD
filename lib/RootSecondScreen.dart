import 'package:flutter/material.dart';
import 'TilesNotes.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

class RootSecondScreen extends StatefulWidget {
  final String title;
  final String text;
  final String root;
  final List<Note> fnotes;
  Color backGroundColor;
  Color tileBackGroundColor;

  RootSecondScreen(
      {Key key,
      this.title,
      this.root,
      this.fnotes,
      this.text,
      this.backGroundColor,
      this.tileBackGroundColor})
      : super(key: key);

  @override
  _RootSecondScreenState createState() =>
      _RootSecondScreenState(root, backGroundColor, tileBackGroundColor);
}

class _RootSecondScreenState extends State<RootSecondScreen> {
  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();
  Color backGroundColor;
  Color tileBackGroundColor;

  final String root;

  _RootSecondScreenState(
      this.root, this.backGroundColor, this.tileBackGroundColor);

//  Future<List<Note>> fetchNotes() async {
////    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Salish.json';
////    var response = await http.get(url);
////
////    var notes = List<Note>();
////
////
////    if (response.statusCode == 200) {
////      var notesJson = json.decode(response.body);
////      for (var noteJson in notesJson) {
////
////        if(noteJson['root'] == root) {
////          notes.add(Note.fromJson(noteJson));
////        }
////      }
////    }
////    return notes;
////  }

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
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(root);
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
              'Root: ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              root,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
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
                      )),
                  margin: const EdgeInsets.only(
                      top: 15.0, bottom: 25.0, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        child: Text(
                          _fnotes[index].title,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        padding: EdgeInsets.only(left: 10),
                      ),
                      Padding(
                        child: Text(
                          _fnotes[index].text,
                          style: TextStyle(
                              color: Color.fromRGBO(238, 239, 240, 1),
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                        padding: EdgeInsets.only(left: 10, bottom: 2),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
