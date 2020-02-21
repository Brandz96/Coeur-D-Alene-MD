import 'package:demo_app/StemSecondScreen.dart';
import 'package:flutter/material.dart';
import 'TilesNotes.dart';
import 'TempDelayClass.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class StemPage extends StatefulWidget {
  StemPage({Key key, this.title, this.backGroundColor, this.tileBackGroundColor}) : super(key: key);

  static const String routeName = "/StemPage";

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;

  @override
  _StemPageState createState() => new _StemPageState(backGroundColor, tileBackGroundColor);
}

class _StemPageState extends State<StemPage> {

  List<StemNote> _notes = List<StemNote>();
  List<StemNote> _fnotes = List<StemNote>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;

  _StemPageState(this.backGroundColor, this.tileBackGroundColor);

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

  Future <List<StemNote>> loadJSON() async {

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


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0),   ),
        backgroundColor: backGroundColor,
      ),
      body: Column(
        children: <Widget>[
          TextField(style: TextStyle(color: tileBackGroundColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Stem',
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                enabledBorder: new UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: tileBackGroundColor),
                ),
              ),
              onChanged: (string) {
                _delay.run((){
                  setState(() {
                    _fnotes = _notes.where((u) =>
                    (u.stem.toLowerCase().contains(string.toLowerCase())))
                        .toList();
                  });
                  //
                });
              }
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Reichard's Stem List",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(
            itemBuilder: (context, index) {
              return new GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => StemSecondScreen(stem: _fnotes[index].stem, backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor,)
                      ));
                },
                child:new Container(
                  height: 70,
                  decoration: new BoxDecoration(
                      color: (index %2 == 0) ? tileBackGroundColor : tileBackGroundColor,
                      borderRadius: new BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        width: 1.0,
                        color:  Colors.white,
                      )
                  ),

                  margin: const EdgeInsets.only(
                      top: 25.0, bottom: 25.0, left: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        child: Text(_fnotes[index].stem,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600,),),
                        padding: EdgeInsets.only(left: 10),),
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
