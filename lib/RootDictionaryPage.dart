import 'package:demo_app/HomePageClone.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'TilesNotes.dart';
import 'TempDelayClass.dart';
import 'RootSecondScreen.dart';
import 'HomePage.dart';

class RootDictionaryPage extends StatefulWidget {
  static const String routeName = "/RootDictionaryPage";
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;

  final String title;

  RootDictionaryPage(
      {Key key, this.title, this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage})
      : super(key: key);

  @override
  _RootDictionaryPageState createState() =>
      _RootDictionaryPageState(backGroundColor, tileBackGroundColor, counterFromPreviousPage);
}

class _RootDictionaryPageState extends State<RootDictionaryPage> {
  int rvalue1;
  int flag1;

  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();
  List<Note> _local = List<Note>();
  final _delay = tempDelay(mill: 200);
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;



  _RootDictionaryPageState(this.backGroundColor, this.tileBackGroundColor, this.counterFromPreviousPage);

//  Future<List<Note>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Salish.json';
//    var response = await http.get(url);
//
//
//    var notes = List<Note>();
//
//
//
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//        notes.add(Note.fromJson(noteJson));
//      }
//    }
//    return notes;
//  }

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

  Widget build(BuildContext context) {

    print(backGroundColor.toString());
    print(tileBackGroundColor.toString());
    print(counterFromPreviousPage);

    return Scaffold(
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
              final snackBar = SnackBar(content: Text("Tap"));
              Scaffold.of(context).showSnackBar(snackBar);

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
          TextField(
              style: TextStyle(color: tileBackGroundColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10.0),
                hintText: 'Search Word',
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
                activeColor: Colors.white,
                onChanged: (val) {
                  rValue(val);
                },
              ),
              new Text(
                'Nicodemus',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              new Radio(
                  value: 2,
                  groupValue: rvalue1,
                  activeColor: Colors.white,
                  onChanged: (val) {
                    rValue(val);
                  }),
              new Text(
                'English',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return new GestureDetector(
                  onDoubleTap: () {
                    Navigator.of(context).pushReplacement(new PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => new RootSecondScreen(root: _fnotes[index].root,backGroundColor: backGroundColor, tileBackGroundColor: tileBackGroundColor),
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
                  child: Tooltip(
                    message: 'Double tap for Root information!',
                    margin: EdgeInsets.only(top: 20),
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
                          top: 15.0, bottom: 25.0, left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  _fnotes[index].title,
                                  style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1),
                                ),
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
                          Padding(
                            child: Text(
                              _fnotes[index].text,
                              style: TextStyle(
                                  color: Color.fromRGBO(238, 239, 240, 1),
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
