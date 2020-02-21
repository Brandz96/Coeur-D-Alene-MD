import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';


class AudioPage extends StatefulWidget {
  AudioPage({Key key, this.title,  this.backGroundColor, this.tileBackGroundColor}) : super(key: key);

  static const String routeName = "/Audio";

  final String title;
  Color backGroundColor;
  Color tileBackGroundColor;

  @override
  _AudioPageState createState() => _AudioPageState(backGroundColor, tileBackGroundColor);
}

class _AudioPageState extends State<AudioPage> {


  List<Link> _notes = List<Link>();
  List<Link> _fnotes = List<Link>();
  Color backGroundColor;
  Color tileBackGroundColor;

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

  _AudioPageState(this.backGroundColor, this.tileBackGroundColor);

  Future <List<Link>> loadJSON() async {

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
        title: new Padding (child: new Text ('Coeur D\' Alene Mobile Dictionary', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 9,),),
          padding: EdgeInsets.all(0), ),
        backgroundColor: backGroundColor,

      ),
      body: Column(
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Audio and Text Files',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26
              ),
            ),
          ),

          Expanded(child:
          ListView.builder(itemBuilder: (context, index) {
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
                    )
                ),


                margin: const EdgeInsets.only(
                  top: 15.0, bottom: 25.0, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      child: Text(_fnotes[index].title,
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),),
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
      ),// This trailing comma makes auto-formatting nicer for build methods.
      backgroundColor: backGroundColor,
    );

  }
}

class Link {

  String title;
  String web;


  Link(this.title, this.web);


  Link.fromJson(Map<String, dynamic> json){
    title = json['title'];
    web = json['link'];
  }
}