import 'package:demo_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'AffixPage.dart';
import 'HomePageClone.dart';
import 'RootDictionaryPage.dart';
import 'TilesNotes.dart';
import 'StemPage.dart';

// ignore: must_be_immutable
class StemSecondScreen extends StatefulWidget {
  final String title;
  final String text;
  final String stem;
  final List<Note> fnotes;
  Color backGroundColor;
  Color tileBackGroundColor;
  Color titleColor;
  int counterFromPreviousPage;

  StemSecondScreen(
      {Key key,
      this.title,
      this.stem,
      this.fnotes,
      this.text,
      this.backGroundColor,
      this.tileBackGroundColor,
        this.counterFromPreviousPage,
        this.titleColor})
      : super(key: key);

  @override
  _StemSecondScreenState createState() => _StemSecondScreenState(
      stem, this.backGroundColor, this.tileBackGroundColor,
      this.counterFromPreviousPage, this.titleColor);
}

class _StemSecondScreenState extends State<StemSecondScreen> {
  List<Note> _notes = List<Note>();
  List<Note> _fnotes = List<Note>();
  Color backGroundColor;
  Color tileBackGroundColor;
  int counterFromPreviousPage;
  Color titleColor;

  final String stem;

  _StemSecondScreenState(this.stem, this.backGroundColor,
      this.tileBackGroundColor, this.counterFromPreviousPage, this.titleColor);

//  Future<List<Note>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/Brandz96/Capstone/master/Stem.json';
//    var response = await http.get(url);
//
//    var notes = List<Note>();
//
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//        if (noteJson['stem'] == stem) {
//          notes.add(Note.fromJson(noteJson));
//        }
//      }
//    }
//    return notes;
//  }

  Future<List<Note>> loadJSON() async {
    var notes2 = List<Note>();
    var link = 'assets/Stem.json';

    var r = await rootBundle.loadString(link);

    String jsonState = r;

    var jsonResponse = json.decode(jsonState);

    for (var n in jsonResponse) {
      if (n['stem'] == stem) {
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

  // ignore: missing_return
  Future<bool> _onBackPressed(){
    Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        new StemPage(backGroundColor: backGroundColor,
          tileBackGroundColor: tileBackGroundColor,
          counterFromPreviousPage: counterFromPreviousPage,
          titleColor: titleColor,),
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
              titleColor: titleColor,),
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
              titleColor: titleColor,),
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
              titleColor: titleColor,),
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
              titlecolor: titleColor,),
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
      iconColor = Colors.white;
      return iconColor;
    } else {
      iconColor = tileBackGroundColor;
      return iconColor;
    }
  }



  @override
  Widget build(BuildContext context) {
    print(stem);
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
            new StemPage(backGroundColor: backGroundColor,
              tileBackGroundColor: tileBackGroundColor,
              counterFromPreviousPage: counterFromPreviousPage,
              titleColor: titleColor,),
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
                    color: titleColor,
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
               color:  setIconColor(counterFromPreviousPage),
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
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'All words based on stem: ',
                  style: TextStyle(
                    color: titleColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  stem,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 35,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return new Container(
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
                          top: 15.0, bottom: 25.0, left: 10, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            child: Text(
                              _fnotes[index].title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: titleColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            padding: EdgeInsets.only(left: 10),
                          ),
                          Padding(
                            child: Text(
                              _fnotes[index].text,
                              style: TextStyle(
                                  color: titleColor,
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
        ),
        backgroundColor: backGroundColor,
      ),
    );
  }
}
